#!/bin/bash
#一直执行  无限循环
while true
do
  #执行的语句
  #记录执行时间
  echo `date "+%F %T"` `sh /root/rsync_add.sh` >> /root/timer_log.txt
  #echo date "+%F %T" >> /root/timer_log.txt 
  #间隔时间 5s
  sleep 5
done
