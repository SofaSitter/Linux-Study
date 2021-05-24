#!/bin/bash
#检测服务是否启动，通过进程的方式
nginx_status=`ps -C nginx --no-header | wc -l`
#根据进程返回数，判断nginx是否宕机
#如果返回行数等于0，证明nginx宕机
if [ $nginx_status -eq 0 ];then
   service keepalived stop
fi
