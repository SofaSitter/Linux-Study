#!/bin/bash
#源码编译安装MySQL
mysql_install() {
	#1、创建用户
`id mysql` &>/dev/null
[ $? -ne 0 ] && useradd -s /sbin/nologin -M mysql
#2、解决依赖
yum install -y cmake
yum install -y ncurses-devel
#3、编译安装
cd /root/soft
tar zxvf mysql-5.6.33.tar.gz
cd mysql-5.6.33
cmake \
-DCMAKE_INSTALL_PREFIX=/usr/local/mysql \
-DMYSQL_DATADIR=/usr/local/mysql/data \
-DSYSCONFDIR=/etc \
-DENABLED_LOCAL_INFILE=1 \
-DWITH_PARTITION_STORAGE_ENGINE=1 \
-DEXTRA_CHARSETS=all \
-DDEFAULT_CHARSET=utf8mb4 \
-DDEFAULT_COLLATION=utf8mb4_general_ci \
-DWITH_SSL=bundled
make && make install
#配置文件
rm -rf /etc/my.cnf
cp /usr/local/mysql/support-files/my-default.cnf /etc/my.cnf
#授权并初始化数据库
chown -R mysql:mysql /usr/local/mysql
/usr/local/mysql/scripts/mysql_install_db --basedir=/usr/local/mysql --datadir=/usr/local/mysql/data --user=mysql
#配置服务、自启动和环境变量
cp /usr/local/mysql/support-files/mysql.server /etc/init.d/mysqld
service mysqld start
chkconfig --add mysqld
echo 'PATH=/usr/local/mysql/bin:$PATH' >> /etc/profile
#删除匿名用户
#设置root域名的密码
rpm -qa|grep expect
if [ $? -ne 0 ];then
   yum -y install expect
fi
#导入环境变量PATH
export PATH=/usr/local/mysql/bin:$PATH
#初始化root密码 删除匿名用户
echo '#!/usr/bin/expect
set timeout 60
spawn mysql_secure_installation
expect {
"enter for none" { send "\r"; exp_continue}
"Y/n" { send "Y\r" ; exp_continue}
"password" { send "123456\r"; exp_continue}
"Cleaning up" { send "\r"}
}
interact ' > mysql_secure_installation.exp
chmod +x mysql_secure_installation.exp
./mysql_secure_installation.exp
}
#脚本开始时间
start_time=`date +%s`
#执行的脚本代码
mysql_install
#脚本结束时间
end_time=`date +%s`
#脚本执行花费时间
const_time=$((end_time-start_time))
echo 'Take time is: '$const_time's'