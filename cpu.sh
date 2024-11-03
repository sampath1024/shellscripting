#!/bin/bash
#purpose: To verify CPU usage
#version:1.0
#created date: Wednesday 11 September 2024 09:25:49 PM IST
#modifiled date:
#author: Sampath
#START#
HOSTNAME=`hostname`
DATE=`date +%F`
top -b n1 | head -n 10 > /tmp/cpuusage
CPU_user=$(cat /tmp/cpuusage | grep "%Cpu(s)" | awk '{print $2}'| cut -d '.' -f 1)
CPU_sys=$(cat /tmp/cpuusage | grep "%Cpu(s)" | awk '{print $4}'| cut -d '.' -f 1)
echo $CPU_user
echo $CPU_sys
if  [ $CPU_user -gt 80 -a $CPU_user -lt 90  ];
then
	echo "Warning for CPU"
	
elif [ $CPU_user -gt 90 -a $CPU_user -lt 98 ];
then 
	echo " CRITICAL for CPU"
else
	echo " Normal for CPU"
fi
#END#
