#!/bin/bash
VIP=192.168.17.205
#配置VIP只有DS响应
echo 1 > /proc/sys/net/ipv4/conf/lo/arp_ignore
echo 2 > /proc/sys/net/ipv4/conf/lo/arp_announce
echo 1 > /proc/sys/net/ipv4/conf/all/arp_ignore
echo 2 > /proc/sys/net/ipv4/conf/all/arp_announce
#绑定VIP到网卡
ifconfig lo:0 $VIP  broadcast $VIP netmask 255.255.255.255 up
#添加主机路由
route add -host $VIP dev lo:0