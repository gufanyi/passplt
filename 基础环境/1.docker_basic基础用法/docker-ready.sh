#!/bin/bash
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
yum install -y ntpdate
ntpdate us.pool.ntp.org
systemctl stop firewalld.service
systemctl disable firewalld.service
# 开启关闭转发
# 如果没有开启，会导致ssh连接数据太慢
# 如果没有开启，会导致容器内部无法连接外部网络
echo 1 > /proc/sys/net/ipv4/ip_forward
sysctl -w net.ipv4.ip_forward=1
cat /proc/sys/net/ipv4/ip_forward
iptables -t nat -F


yum install iptables-services 
systemctl restart iptables.service
systemctl restart iptables.service 
systemctl enable iptables.service 
iptables [-t table] COMMAND chain CRETIRIA -j ACTION



mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
cd /etc/yum.repos.d/
wget http://mirrors.163.com/.help/CentOS6-Base-163.repo
yum makecache
yum -y update
 yum -y install vim*


 -Duser.timezone=GMT+8