#!/bin/bash

printf "enter desired hostname\n"
read hostname
echo "enter ip address\n"
read ip

sudo echo "$ip	$hostname" >> /etc/hosts
echo "'$ip	$hostname' added as entry into /etc/hosts"
cat /etc/hosts
