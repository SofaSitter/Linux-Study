## 1、克隆复制虚拟机

![img](/assets/wps127.jpg)

![img](/assets/wps128.jpg)

![img](/assets/wps129.jpg)

![img](/assets/wps130.jpg)

![img](/assets/wps131.jpg)

![img](/assets/wps132.jpg)

![img](/assets/wps133.jpg)

## 2、配置FQDN

①/etc/hosts

![img](/assets/wps134.jpg)

②/etc/sysconfig/network

![img](/assets/wps135.jpg)

③查看一下配置效果

hostname  hostname -f

## 3、配置新虚拟机的网卡

问题：

![img](/assets/wps136.jpg)

解决方案

配置这个文件

![img](/assets/wps137.jpg)

![img](/assets/wps138.jpg)

/etc/sysconfig/network-scripts/ifcfg-eth0

![img](/assets/wps139.jpg)

重启服务器

shell > reboot

![img](/assets/wps140.jpg)


