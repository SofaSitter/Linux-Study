#!/bin/bash
# 
# chkconfig: - 88 12
# description: LVS script for VS/NAT
VIP=192.168.24.52
RIP1=192.168.17.102
RIP2=172.168.17.101
# 配置服务
case "$1" in
start)           
  #配置网卡转发
  echo 1 > /proc/sys/net/ipv4/ip_forward
  #判断安装ipvsadm
  rpm -qa|grep ipvsadm >> /dev/null
  if [ $? -ne 0 ];then
      yum -y install ipvsadm
  fi
  #清空lvs规则
  ipvsadm -C
  #添加一个转发服务  
  ipvsadm -A -t $VIP:80 -s rr
  #添加分发节点
  ipvsadm -a -t $VIP:80 -r $RIP1 -m
  ipvsadm -a -t $VIP:80 -r $RIP2 -m
;; 
  
stop)
  #关闭网卡转发
  echo 0 > /proc/sys/net/ipv4/ip_forward
  #清空lvs规则
  ipvsadm -C
;;
status)
  #查看当前规则
  ipvsadm -Ln
;;  
*) 
  echo "Usage: $0 {start|stop|status}"
;; esac