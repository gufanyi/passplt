#!/bin/bash
ip route add 192.168.1.0/24 via 172.18.44.204
ip route add 192.168.2.0/24 via 172.18.44.208
ip route add 192.168.3.0/24 via 172.18.44.202
ip route add 192.168.4.0/24 via 172.18.44.205
ip route add 192.168.5.0/24 via 172.18.44.203
ip route add 192.168.6.0/24 via 172.18.44.174
ip route add 192.168.7.0/24 via 172.18.44.212
ip route add 192.168.8.0/24 via 172.18.44.216
ip route add 192.168.9.0/24 via 172.18.44.221
ip route add 192.168.13.0/24 via 172.18.44.241


route add –host 192.168.168.119 gw 192.168.168.1
route del –host 192.168.8.0/24 via
route del -net 192.168.8.0/24 via 172.18.44.216
ip route del 192.168.8.0/24 via 172.18.44.201 dev eno16777736 