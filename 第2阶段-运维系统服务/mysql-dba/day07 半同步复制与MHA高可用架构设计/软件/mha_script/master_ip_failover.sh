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
#!/usr/bin/env perl
#!/usr/bin/env perl

use strict;
use warnings FATAL => 'all';

use Getopt::Long;

my (
    $command,          $ssh_user,        $orig_master_host, $orig_master_ip,
    $orig_master_port, $new_master_host, $new_master_ip,    $new_master_port
);

#my $gateway = '10.77.133.1';
my $vip  = shift;
#my $bcast = '10.77.133.255';
#my $netmask = '255.255.255.0';
my $interface = 'ens33';
my $key = shift;
#my $ssh_start_vip = "sudo /sbin/ifconfig $interface:$key $vip netmask $netmask && sudo /sbin/arping -f -q -c 5 -w 5 -I $interface -s $vip  -U $gateway";
my $ssh_stop_vip = "sudo /sbin/ifconfig $interface:$key down";

GetOptions(
    'command=s'          => \$command,
    'ssh_user=s'         => \$ssh_user,
    'orig_master_host=s' => \$orig_master_host,
    'orig_master_ip=s'   => \$orig_master_ip,
    'orig_master_port=i' => \$orig_master_port,
    'new_master_host=s'  => \$new_master_host,
    'new_master_ip=s'    => \$new_master_ip,
    'new_master_port=i'  => \$new_master_port,
);

exit &main();

sub main {

    #print "\n\nIN SCRIPT TEST====$ssh_stop_vip==$ssh_start_vip===\n\n";

    if ( $command eq "stop" || $command eq "stopssh" ) {

        my $exit_code = 1;
        eval {
            print "Disabling the VIP on old master: $orig_master_host \n";
            &stop_vip();
            $exit_code = 0;
        };
        if ($@) {
            warn "Got Error: $@\n";
            exit $exit_code;
        }
        exit $exit_code;
    }
    elsif ( $command eq "start" ) {

        my $exit_code = 10;
        eval {
            print "Enabling the VIP - $vip on the new master - $new_master_host \n";
            &start_vip();
            $exit_code = 0;
        };
        if ($@) {
            warn $@;
            exit $exit_code;
        }
        exit $exit_code;
    }
    elsif ( $command eq "status" ) {
        print "Checking the Status of the script.. OK \n";
        exit 0;
    }
    else {
        &usage();
        exit 1;
    }
}

sub start_vip() {
    my $bcast  = `ssh $ssh_user\@$new_master_host sudo /sbin/ifconfig | grep 'Bcast' | head -1 | awk '{print \$3}' | awk -F":" '{print \$2}'`;
    chomp $bcast;
    my $gateway  = `ssh $ssh_user\@$new_master_host sudo /sbin/route -n  | grep 'UG' | awk '{print \$2}'`;
    chomp $gateway;
    my $netmask  = `ssh $ssh_user\@$new_master_host sudo /sbin/ifconfig | grep 'Bcast' | head -1 | awk '{print \$4}' | awk -F":" '{print \$2}'`;
    chomp $netmask;
    my $ssh_start_vip = "sudo /sbin/ifconfig $interface:$key $vip broadcast $bcast netmask $netmask && sudo /sbin/arping -f -q -c 5 -w 5 -I $interface -s $vip  -U $gateway";
    print "=======$ssh_start_vip=================\n";
    `ssh $ssh_user\@$new_master_host \" $ssh_start_vip \"`;
}
sub stop_vip() {
    my $ssh_user = "admin";
    print "=======$ssh_stop_vip==================\n";
    `ssh $ssh_user\@$orig_master_host \" $ssh_stop_vip \"`;
}

sub usage {
    print
    "Usage: master_ip_failover --command=start|stop|stopssh|status --orig_master_host=host --orig_master_ip=ip --orig_master_port=port --new_master_host=host --new_master_ip=ip --new_master_port=port\n";
}
