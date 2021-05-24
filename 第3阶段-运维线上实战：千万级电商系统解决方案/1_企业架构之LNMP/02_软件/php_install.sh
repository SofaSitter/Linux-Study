#!/bin/bash
php_install(){
#php编译安装
#和nginx使用相同的用户,如果没有就创建
`id www` &> /dev/null
[ $? -ne 0 ] && useradd -s /sbin/nologin -M www
#解决依赖
yum -y install libxml2-devel libjpeg-devel libpng-devel freetype-devel curl-devel openssl-devel
#解压
tar xvf php-7.2.12.tar.gz
cd php-7.2.12
#编译安装php
./configure --prefix=/usr/local/php --with-config-file-path=/usr/local/php/etc --enable-fpm --with-fpm-user=www --with-fpm-group=www --with-mysqli=mysqlnd --with-pdo-mysql=mysqlnd --with-iconv-dir --with-freetype-dir --with-jpeg-dir --with-png-dir --with-zlib --with-libxml-dir --enable-xml --disable-rpath --enable-bcmath --enable-shmop --enable-sysvsem --enable-inline-optimization --with-curl --enable-mbregex --enable-mbstring --enable-ftp --with-gd --with-openssl --with-mhash --enable-pcntl --enable-sockets --with-xmlrpc --with-libzip --enable-soap --without-pear --with-gettext --disable-fileinfo --enable-maintainer-zts && make && make install
#配置文件初始化
cp php.ini-development /usr/local/php/etc/php.ini
#php-fpm服务配置文件
cp /usr/local/php/etc/php-fpm.conf.default /usr/local/php/etc/php-fpm.conf
#php-fpm服务子配置文件
cp /usr/local/php/etc/php-fpm.d/www.conf.default /usr/local/php/etc/php-fpm.d/www.conf
#配置服务及其环境变量
cp /root/soft/php-7.2.12/sapi/fpm/init.d.php-fpm /etc/init.d/php-fpm
chmod +x /etc/init.d/php-fpm
service php-fpm start
chkconfig --add php-fpm
echo 'PATH=/usr/local/php/bin:$PATH' >> /etc/profile
}
#脚本开始时间
start_time=`date +%s`
#执行的脚本代码
php_install
#脚本结束时间
end_time=`date +%s`
#脚本执行花费时间
const_time=$((end_time-start_time))
echo 'Take time is: '$const_time's'