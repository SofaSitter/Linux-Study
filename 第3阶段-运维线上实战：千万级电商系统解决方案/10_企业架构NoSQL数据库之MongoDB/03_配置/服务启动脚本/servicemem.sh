#!/bin/bash
#memcached服务器操作
BASEDIR="/usr/local/memcached"
BIN=$BASEDIR"/bin/memcached"
#echo $BIN
USER=root
EXE="memcached"
#引入系统函数库
. /etc/rc.d/init.d/functions
#启动
start () {
  echo -n $"Starting $prog: "
  daemon $BIN -u $USER -d
  RETVAL=$?
  [ $RETVAL -eq 0 ] && echo "successfull"
}
#关闭
stop () {
  echo -n $"Stopping $prog: "
  killproc  $EXE
  RETVAL=$?
  [ $RETVAL -eq 0  ] && echo "is already stop"
}
#重启
restart () {
  stop
  start
}
#查看状态
mem_status () {
  status $EXE
}
case "$1" in
  start)
      start
      ;;
  stop)
      stop
      ;;
  restart)
      restart
      ;;
  status)
      mem_status
      ;;
  *)
      echo "$EXE {start|stop|restart|status}"
esac
