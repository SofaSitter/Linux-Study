#!/usr/bin/env perl

#  Copyright (C) 2011 DeNA Co.,Ltd.
#
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#   along with this program; if not, write to the Free Software
#  Foundation, Inc.,
#  51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

## Note: This is a sample script and is not complete. Modify the script based on your environment.

use strict;
use warnings FATAL => 'all';

use Getopt::Long;
use MHA::DBHelper;
use MHA::NodeUtil;
use Time::HiRes qw( sleep gettimeofday tv_interval );
use Data::Dumper;

my $_tstart;
my $_running_interval = 0.1;
my (
  $command,          $orig_master_host, $orig_master_ip,
  $orig_master_port, $orig_master_user, 
  $new_master_host,  $new_master_ip,    $new_master_port,
  $new_master_user, $orig_master_password, $new_master_password,  
);
#my $gateway = '10.77.133.1';
my $vip = shift;
#my $bcast = '10.77.133.255';
#my $netmask = '255.255.255.0';
my $interface = 'ens33';
my $key = shift;
#my $ssh_start_vip = "sudo /sbin/ifconfig $interface:$key $vip netmask $netmask && sudo /sbin/arping -f -q -c 5 -w 5 -I $interface -s $vip  -U $gateway";
my $ssh_stop_vip = "sudo /sbin/ifconfig $interface:$key down";
my $ssh_user = "admin";
#my $orig_master_user='mha_user';
#my $orig_master_password='UKIw57RnC76m';
#my $new_master_user='mha_user';
#my $new_master_password='UKIw57RnC76m';

GetOptions(
  'command=s'              => \$command,
  #'ssh_user=s'             => \$ssh_user,  
  'orig_master_host=s'     => \$orig_master_host,
  'orig_master_ip=s'       => \$orig_master_ip,
  'orig_master_port=i'     => \$orig_master_port,
  'orig_master_user=s'     => \$orig_master_user,
  'orig_master_password=s' => \$orig_master_password,
  'new_master_host=s'      => \$new_master_host,
  'new_master_ip=s'        => \$new_master_ip,
  'new_master_port=i'      => \$new_master_port,
  'new_master_user=s'      => \$new_master_user,
  'new_master_password=s'  => \$new_master_password,
);

exit &main();

sub current_time_us {
  my ( $sec, $microsec ) = gettimeofday();
  my $curdate = localtime($sec);
  return $curdate . " " . sprintf( "%06d", $microsec );
}

sub sleep_until {
  my $elapsed = tv_interval($_tstart);
  if ( $_running_interval > $elapsed ) {
    sleep( $_running_interval - $elapsed );
  }
}

sub get_threads_util {
  my $dbh                    = shift;
  my $my_connection_id       = shift;
  my $running_time_threshold = shift;
  my $type                   = shift;
  $running_time_threshold = 0 unless ($running_time_threshold);
  $type                   = 0 unless ($type);
  my @threads;

  my $sth = $dbh->prepare("SHOW PROCESSLIST");
  $sth->execute();

  while ( my $ref = $sth->fetchrow_hashref() ) {
    my $id         = $ref->{Id};
    my $user       = $ref->{User};
    my $host       = $ref->{Host};
    my $command    = $ref->{Command};
    my $state      = $ref->{State};
    my $query_time = $ref->{Time};
    my $info       = $ref->{Info};
    $info =~ s/^\s*(.*?)\s*$/$1/ if defined($info);
    next if ( $my_connection_id == $id );
    next if ( defined($query_time) && $query_time < $running_time_threshold );
    next if ( defined($command)    && $command eq "Binlog Dump" );
    next if ( defined($user)       && $user eq "system user" );
    next
      if ( defined($command)
      && $command eq "Sleep"
      && defined($query_time)
      && $query_time >= 1 );

    if ( $type >= 1 ) {
      next if ( defined($command) && $command eq "Sleep" );
      next if ( defined($command) && $command eq "Connect" );
    }

    if ( $type >= 2 ) {
      next if ( defined($info) && $info =~ m/^select/i );
      next if ( defined($info) && $info =~ m/^show/i );
    }

    push @threads, $ref;
  }
  return @threads;
}

sub main {
  if ( $command eq "stop" ) {
    ## Gracefully killing connections on the current master
    # 1. Set read_only= 1 on the new master
    # 2. DROP USER so that no app user can establish new connections
    # 3. Set read_only= 1 on the current master
    # 4. Kill current queries
    # * Any database access failure will result in script die.
    my $exit_code = 1;
    eval {
      ## Setting read_only=1 on the new master (to avoid accident)
      my $new_master_handler = new MHA::DBHelper();

      # args: hostname, port, user, password, raise_error(die_on_error)_or_not
      $new_master_handler->connect( $new_master_ip, $new_master_port,
        $new_master_user, $new_master_password, 1 );
      print current_time_us() . " Set read_only on the new master.. ";
      $new_master_handler->enable_read_only();
      if ( $new_master_handler->is_read_only() ) {
        print "ok.\n";
      }
      else {
        die "Failed!\n";
      }
      $new_master_handler->disconnect();

      # Connecting to the orig master, die if any database error happens
      my $orig_master_handler = new MHA::DBHelper();
      $orig_master_handler->connect( $orig_master_ip, $orig_master_port,
        $orig_master_user, $orig_master_password, 1 );

      ## Drop application user so that nobody can connect. Disabling per-session binlog beforehand
      #$orig_master_handler->disable_log_bin_local();
      #print current_time_us() . " Drpping app user on the orig master..\n";
      #FIXME_xxx_drop_app_user($orig_master_handler);

      ## Waiting for N * 100 milliseconds so that current connections can exit
      my $time_until_read_only = 15;
      $_tstart = [gettimeofday];
      my @threads = get_threads_util( $orig_master_handler->{dbh},
        $orig_master_handler->{connection_id} );
      while ( $time_until_read_only > 0 && $#threads >= 0 ) {
        if ( $time_until_read_only % 5 == 0 ) {
          printf
"%s Waiting all running %d threads are disconnected.. (max %d milliseconds)\n",
            current_time_us(), $#threads + 1, $time_until_read_only * 100;
          if ( $#threads < 5 ) {
            print Data::Dumper->new( [$_] )->Indent(0)->Terse(1)->Dump . "\n"
              foreach (@threads);
          }
        }
        sleep_until();
        $_tstart = [gettimeofday];
        $time_until_read_only--;
        @threads = get_threads_util( $orig_master_handler->{dbh},
          $orig_master_handler->{connection_id} );
      }

      ## Setting read_only=1 on the current master so that nobody(except SUPER) can write
      print current_time_us() . " Set read_only=1 on the orig master.. ";
      $orig_master_handler->enable_read_only();
      if ( $orig_master_handler->is_read_only() ) {
        print "ok.\n";
      }
      else {
        die "Failed!\n";
      }

      ## Waiting for M * 100 milliseconds so that current update queries can complete
      my $time_until_kill_threads = 5;
      @threads = get_threads_util( $orig_master_handler->{dbh},
        $orig_master_handler->{connection_id} );
      while ( $time_until_kill_threads > 0 && $#threads >= 0 ) {
        if ( $time_until_kill_threads % 5 == 0 ) {
          printf
"%s Waiting all running %d queries are disconnected.. (max %d milliseconds)\n",
            current_time_us(), $#threads + 1, $time_until_kill_threads * 100;
          if ( $#threads < 5 ) {
            print Data::Dumper->new( [$_] )->Indent(0)->Terse(1)->Dump . "\n"
              foreach (@threads);
          }
        }
        sleep_until();
        $_tstart = [gettimeofday];
        $time_until_kill_threads--;
        @threads = get_threads_util( $orig_master_handler->{dbh},
          $orig_master_handler->{connection_id} );
      }



                print "Disabling the VIP on old master: $orig_master_host \n";
                &stop_vip();     


      ## Terminating all threads
      print current_time_us() . " Killing all application threads..\n";
      $orig_master_handler->kill_threads(@threads) if ( $#threads >= 0 );
      print current_time_us() . " done.\n";
      #$orig_master_handler->enable_log_bin_local();
      $orig_master_handler->disconnect();

      ## After finishing the script, MHA executes FLUSH TABLES WITH READ LOCK
      $exit_code = 0;
    };
    if ($@) {
      warn "Got Error: $@\n";
      exit $exit_code;
    }
    exit $exit_code;
  }
  elsif ( $command eq "start" ) {
    ## Activating master ip on the new master
    # 1. Create app user with write privileges
    # 2. Moving backup script if needed
    # 3. Register new master's ip to the catalog database

# We don't return error even though activating updatable accounts/ip failed so that we don't interrupt slaves' recovery.
# If exit code is 0 or 10, MHA does not abort
    my $exit_code = 10;
    eval {
      my $new_master_handler = new MHA::DBHelper();

      # args: hostname, port, user, password, raise_error_or_not
      $new_master_handler->connect( $new_master_ip, $new_master_port,
        $new_master_user, $new_master_password, 1 );

      ## Set read_only=0 on the new master
      #$new_master_handler->disable_log_bin_local();
      print current_time_us() . " Set read_only=0 on the new master.\n";
      $new_master_handler->disable_read_only();

      ## Creating an app user on the new master
      #print current_time_us() . " Creating app user on the new master..\n";
      #FIXME_xxx_create_app_user($new_master_handler);
      #$new_master_handler->enable_log_bin_local();
      $new_master_handler->disconnect();

      ## Update master ip on the catalog database, etc
                print "Enabling the VIP - $vip on the new master - $new_master_host \n";
                &start_vip();
                $exit_code = 0;
    };
    if ($@) {
      warn "Got Error: $@\n";
      exit $exit_code;
    }
    exit $exit_code;
  }
  elsif ( $command eq "status" ) {

    # do nothing
    exit 0;
  }
  else {
    &usage();
    exit 1;
  }
}

# A simple system call that enable the VIP on the new master 
sub start_vip() {
    my $bcast  = `ssh $ssh_user\@$new_master_host sudo /sbin/ifconfig | grep 'Bcast' | head -1 | awk '{print \$3}' | awk -F":" '{print \$2}'`;
    chomp $bcast;
    my $gateway  = `ssh $ssh_user\@$new_master_host sudo /sbin/route -n  | grep 'UG' | awk '{print \$2}'`;
    chomp $gateway;
    my $netmask  = `ssh $ssh_user\@$new_master_host sudo /sbin/ifconfig | grep 'Bcast' | head -1 | awk '{print \$4}' | awk -F":" '{print \$2}'`;
    chomp $netmask;
    my $ssh_start_vip = "sudo /sbin/ifconfig $interface:$key $vip broadcast $bcast netmask $netmask && sudo /sbin/arping -f -q -c 5 -w 5 -I $interface -s $vip  -U $gateway";
    print "===========$ssh_start_vip===========================\n";
    `ssh $ssh_user\@$new_master_host \" $ssh_start_vip \"`;
}
# A simple system call that disable the VIP on the old_master
sub stop_vip() {
    print "===========$ssh_stop_vip===========================\n";
    `ssh $ssh_user\@$orig_master_host \" $ssh_stop_vip \"`;
}

sub usage {
  print
"Usage: master_ip_online_change --command=start|stop|status --orig_master_host=host --orig_master_ip=ip --orig_master_port=port --new_master_host=host --new_master_ip=ip --new_master_port=port\n";
  die;
}
