#!/bin/bash
#与数据库进行交互的到信息
mysql=usr/local/mysql/bin/mysql
Y=Yes
io_sql=`mysql -uroot -p -e 'show slave status \G;' | head -13 | tail -2|awk -F':' '{print $2}'`
#io_sql=`mysql -uroot -p -e 'show slave status \G;' | head -13 | tail -2`
#echo $io_sql
io=`echo $io_sql | awk -F ' '  '{print $1}'` 
sql=`echo $io_sql | awk -F ' '  '{print $2}'`
if [ $io = $Y ];then
        if [ "$sql" = "$Y" ];then 
        echo '主从复制slave端服务正常'
        else 
        echo '主从复制slave端出现异常请检查'
        fi  
fi
