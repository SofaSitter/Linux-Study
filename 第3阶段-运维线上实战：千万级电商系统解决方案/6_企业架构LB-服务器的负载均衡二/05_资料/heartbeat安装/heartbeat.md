**通过Heartbeat实现负载均衡服务器的高可用**

> 环境准备：
>
> server04   LB   192.168.17.103
>
> server05   backup LB   192.168.17.104
>
> VIP：192.168.17.202

## 1、安装

```shell
#安装wget
shell > yum install -y wget
#配置epel源
shell > wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-6.repo
#安装heartbeat
shell > yum install -y heartbeat
```

##2、配置

**①两台服务器都需要操作**

复制初始化配置文件

```shell
shell > cd /usr/share/doc/heartbeat-3.0.4/
shell > cp authkeys ha.cf haresources /etc/ha.d/
shell > cd /etc/ha.d
```

在两台服务器的/etc/hosts文件解析

```
192.168.17.103 server04
192.168.17.104 server05
```

/etc/ha.d/authkeys文件去掉对应注释

```shell
#到文件中，去掉以下几行的注释
auth 1
1 crc
2 sha1 HI!
3 md5 Hello!
```

==记得授权authkeys权限600==

**②主服务器配置**

/etc/haresources文件

```shell
#node-name resource1 resource2 ... resourceN
#添加本主机名称  VIP  启动的服务名称
#添加的服务器名称  需要在/etc/init.d里有server管理服务的脚本
server04 192.168.17.202 nginx
```

/etc/ha.cf文件

```shell
#找到ucast项 去掉注释并修改
#给备服务器发送的地址  这里写备服务器的IP
ucast eth0 192.168.17.104
#找到node项，并去掉注释添加
node server04
node server05
```

**③备服务器配置**

/etc/haresources文件

```shell
#node-name resource1 resource2 ... resourceN
#添加本主机名称  VIP  启动的服务名称
server05 192.168.17.202 nginx
```

/etc/ha.cf文件

```shell
#找到ucast项 去掉注释并修改
#给备服务器发送的地址  这里写备服务器的IP
ucast eth0 192.168.17.103
#找到node项，并去掉注释添加
node server04
node server05
```
