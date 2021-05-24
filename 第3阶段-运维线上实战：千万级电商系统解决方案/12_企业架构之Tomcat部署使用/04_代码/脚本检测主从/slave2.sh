#!/bin/bash
read -p "输入用户名：" name
s=`mysql -u"$name" -p -e "show slave status\G;"`
a=`echo -e "$s"|sed -n 's/^\(.*\)Slave_IO_Running: \(.\{3\}\)/\2/p'`
b=`echo -e "$s"|sed -n 's/^\(.*\)Slave_SQL_Running: \(.\{3\}\)/\2/p'`
if [ $a == 'Yes' ]&&[ $b == 'Yes' ];then
        echo "Mysql Slave is OK"
else
        echo "Mysql Slave is Not OK"
fi
