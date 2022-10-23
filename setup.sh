#! /bin/sh
sudo ifconfig eth1 192.168.1.213 netmask 255.255.255.0
echo "vm.max_map_count=262144" >> /etc/sysctl.conf
sudo sysctl -p
sysctl vm.max_map_count