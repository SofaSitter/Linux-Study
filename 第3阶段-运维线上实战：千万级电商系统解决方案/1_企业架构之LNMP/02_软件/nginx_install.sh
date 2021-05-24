#!/bin/bash
#编译安装Nginx
nginx_install(){
#创建软件运行用户
`id www` &>>/dev/null
if [ $? -ne 0 ];then
   useradd -s/sbin/nologin -M www
fi
#安装依赖
yum -y install pcre-devel zlib-devel openssl-devel
#编译安装
cd /root/soft
tar xvf nginx-1.14.2.tar.gz
cd nginx-1.14.2
./configure --prefix=/usr/local/nginx --user=www --group=www --with-http_ssl_module --with-http_stub_status_module --with-http_realip_module && make && make install
}
#脚本开始时间
start_time=`date +%s`
#执行的脚本代码
nginx_install
#脚本结束时间
end_time=`date +%s`
#脚本执行花费时间
const_time=$((end_time-start_time))
echo 'Take time is: '$const_time's'