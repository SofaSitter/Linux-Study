#!/bin/bash
#安装memcached的php扩展
#1、解决依赖
tar xvf libmemcached-1.0.18.tar.gz
cd libmemcached-1.0.18
./configure --prefix=/usr/local/libmemcached && make && make install
#2、安装编译php-memcached
cd /root/soft
tar xvf memcached-3.1.3.tgz
cd memcached-3.1.3
#注意一定php是已经配置环境变量的/usr/local/php/bin
phpize
./configure --with-libmemcached-dir=/usr/local/libmemcached --disable-memcached-sasl&& make && make install
#配置php.ini
sed -i "868c extension=memcached.so" /usr/local/php/etc/php.ini