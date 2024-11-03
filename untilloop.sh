#!/bin/bash
#purpose:
#version:
#created date: Sunday 08 September 2024 08:28:52 PM IST
#modifiled date:
#author: Sampath
#START#
echo -e " please enter IP address to ping: \c"
read -r ip
until ping -c 3 $ip 
do
	echo "Host $ip is still down"
	sleep 1
done
echo "host $ip is up now"
#END#
