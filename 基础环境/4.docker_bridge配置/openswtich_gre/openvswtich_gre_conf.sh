#!/bin/bash

echo 'flow script exe on 192.168.59.103'
echo 'setup bridge-utils'
yum install bridge-utils

echo 'host1:192.168.59.103'
# host1 192.168.59.103
# host2 192.168.59.104

echo 'inspecet ovs version'
sudo ovs-vsctl show  

echo 'add ovs bridge'
sudo ovs-vsctl add-br obr0 

echo 'give ovs bridge obr0 add interface gre0'
sudo ovs-vsctl add-port obr0 gre0 

echo 'setting gre0 neetd conntect to remote_host_ip'
sudo ovs-vsctl set interface gre0 type=gre options:remote_ip=192.168.59.104

echo 'add vitual bridge br0'
sudo brctl addbr br0

echo 'setting br0 ip and netmask'
sudo ifconfig br0 192.168.1.1 netmask 255.255.255.0

echo 'give virtual bridge br0 add interface obr0'
sudo brctl addif br0 obr0

echo 'look up virtual bridge'
sudo brctl show

# reder me  when docker start need select virtual bridge -b=br0 
echo 'modify route table'
sudo ip route add 192.168.2.0/24 via 192.168.59.104 dev eno16777736



# echo 'flow script exe on 192.168.59.104'
# echo 'inspecet ovs version'
# sudo ovs-vsctl show  

# echo 'add ovs bridge'
# sudo ovs-vsctl add-br obr0 

# echo 'give ovs bridge obr0 add interface gre0'
# sudo ovs-vsctl add-port obr0 gre0 

# echo 'setting gre0 neetd conntect to remote_host_ip'
# sudo ovs-vsctl set interface gre0 type=gre options:remote_ip=192.168.59.103

# echo 'add vitual bridge br0'
# sudo brctl addbr br0

# echo 'setting br0 ip and netmask'
# sudo ifconfig br0 192.168.2.1 netmask 255.255.255.0

# echo 'give virtual bridge br0 add interface obr0'
# sudo brctl addif br0 obr0

# echo 'look up virtual bridge'
# sudo brctl show

# reder me  when docker start need select virtual bridge -b=br0 

# sudo ip route add 192.168.1.0/24 via 192.168.59.103 dev eno16777736





 
 
