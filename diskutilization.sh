#!/bin/bash
#purpose: To check disk utilization and send mail 
#version:1.0
#created date: Wednesday 11 September 2024 07:13:18 PM IST
#modifiled date:
#author: Sampath
#START#
DISK=`df -h /var | tail -n 1 | awk '{print $5}' | sed 's/%/ /g'`
if [ $DISK -gt 12 -a $DISK -le 15 ] ; then
                      
	echo " Disk utilization for `hostname` is high" 
else
	echo " disk utilization for $(hostname) is low"
fi



#END#
