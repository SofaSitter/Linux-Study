#!/bin/bash
#添加路由默认网关到DIP
DIP=192.168.17.103
#删除默认
route del default
#添加网关
route add default gw $DIP