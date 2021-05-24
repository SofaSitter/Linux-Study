#!/bin/bash
#slaveinfo=$(/usr/local/mysql/bin/mysql -uroot -p123456 -e "show slave status \G")
#echo $slaveinfo
#echo $slaveinfo | grep Slave_IO_Running |awk {'print $2'}
#if [ `mysql -uroot -p123456 -e "show slave status\G" |grep 'Slave_IO_Running' |awk '{sub(/^[ \t]*/,"");print $1}'` && `mysql -uroot -p123456 -e "show slave status\G" |grep 'Slave_SQL_Running' |awk '{sub(/^[ \t]*/,"");print $1}'`  ];then
 #  echo 'ok';
#fi
IO=`mysql -uroot -p123456 -e "show slave status \G" |grep 'Slave_IO_Running' |awk '{sub(/^[ \t]*/,"");print $2}'`
SQL=`mysql -uroot -p123456 -e "show slave status \G" |grep 'Slave_SQL_Running' |awk '{sub(/^[ \t]*/,"");print $2}'`
if [[$IO == 'Yes']] && [[$SQL == 'Yes']];then
   echo 'slave is ok';
fi
