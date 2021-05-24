#!/bin/bash
## chkconfig: - 88 12
# description: LVS script for VS/DR
VIP=192.168.17.205
RIP1=192.168.17.101
RIP2=192.168.17.103
#GW=192.168.17.2
# 配置服务
case "$1" in
start)
  #DR配置绑定VIP
  ifconfig eth1:0 $VIP broadcast $VIP netmask 255.255.255.255 up
  #添加主机路由
  route add -host $VIP dev eth1:0
  #配置网卡转发
  echo 1 > /proc/sys/net/ipv4/ip_forward
  #配置网关
 # route del default
 # route add default gw $GW
  #判断安装ipvsadm
  rpm -qa|grep ipvsadm >> /dev/null
  if [ $? -ne 0 ];then
      yum -y install ipvsadm
  fi
  #清空lvs规则
  ipvsadm -C
  #添加一个转发服务
  ipvsadm -A -t $VIP:3306 -s rr
  #添加分发节点
  ipvsadm -a -t $VIP:3306 -r $RIP1 -g
  ipvsadm -a -t $VIP:3306 -r $RIP2 -g
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
  echo "Usage: $0 {start|stop}"
;; esac
