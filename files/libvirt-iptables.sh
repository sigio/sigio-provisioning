#!/bin/sh
/sbin/iptables -t nat -A POSTROUTING -s 192.168.123.0/24 ! -d 192.168.123.0/24 -p tcp -j MASQUERADE --to-ports 1024-65535
/sbin/iptables -t nat -A POSTROUTING -s 192.168.123.0/24 ! -d 192.168.123.0/24 -p udp -j MASQUERADE --to-ports 1024-65535
/sbin/iptables -t nat -A POSTROUTING -s 192.168.123.0/24 ! -d 192.168.123.0/24 -j MASQUERADE

/sbin/iptables -t filter -A FORWARD -d 192.168.123.0/24 -o virbr1 -m state --state RELATED,ESTABLISHED -j ACCEPT
/sbin/iptables -t filter -A FORWARD -s 192.168.123.0/24 -i virbr1 -j ACCEPT
/sbin/iptables -t filter -A FORWARD -i virbr1 -o virbr1 -j ACCEPT

/etc/init.d/iptables-persistent save || /etc/init.d/iptables save
# (for debian )                     or  (for centos)
