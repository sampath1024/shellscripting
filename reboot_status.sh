#!/bin/bash
#purpose:
#version:
#created date: Sunday 22 September 2024 08:43:15 PM IST
#modifiled date:
#author: Sampath
#START#
RED='\033[0;31m'
NC='\033[0m'
for i in `cat hosts`
do
	echo " checking the ping status"
	ping_value="$(ping -c 1 $i | tail -n 2 | head -n 1 | awk '{print $6}' | sed 's\%\ \g')"

	if [[ "$ping_value" -eq 0 ]];
	then
		echo " Server is up and checking the uptime details"
		ssh -q $i <<EOF
echo " Connecting to `hostname` "
hostname
echo " Server is runing since"
uptime
EOF
else
	echo -e " $i is not reachable:"
	fi
done

#END#
