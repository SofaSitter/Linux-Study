#!/bin/bash
if [ ! $1 ];then
  hostname='server01'
else
  hostname=$1
fi
if [ ! $2 ];then
  domain='server01.lnmp.com'
else
  domain=$2
fi
#设置主机名称
sed -i "s/localhost.localdomain/$hostname/" /etc/sysconfig/network;
#解析
echo "192.168.17.102   $hostname $domain" >> /etc/hosts;
#关闭防火墙
#iptables
service iptables stop >> /dev/null
chkconfig iptables off
#关闭selinux
setenforce 0 &>>/dev/null
sed -i "s/SELINUX=enforcing/SELINUX=disabled/" /etc/selinux/config;
#yum源配置
if [[ ! -d /dvd1 ]] && [[ ! -d /dvd2 ]];then
   mkdir /dvd1 /dvd2
fi
#挂载一下顺序 dvd1为4.2G dvd2 1.2G
mount /dev/sr0 /dvd2 &>> /dev/null
mount /dev/sr1 /dvd1 &>> /dev/null
#开机自动挂载
echo 'mount /dev/sr0 /dvd2' >> /etc/rc.local
echo 'mount /dev/sr1 /dvd1' >> /etc/rc.local
#备份原来的源
cd /etc/yum.repos.d
if [ ! -d /etc/yum.repos.d/bak ];then
   mkdir bak
fi
mv ./* ./bak &>>/dev/null
#配置本地源
cp /root/local.repo ./
yum makecache &>>/dev/null
#安装vim
yum -y install vim
#行号
echo "set nu" >> /root/.vimrc
#搜索关键字高亮
sed -i "8calias grep='grep --color'" /root/.bashrc
#ntpd服务 时间校时
yum install -y ntp
chkconfig ntpd on