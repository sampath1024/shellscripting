#!/bin/bash
#purpose: to verify swap utilization
#version:1.0
#created date: Wednesday 11 September 2024 08:05:34 PM IST
#modifiled date:
#author: Sampath
#START#
SWAP=`free -g | tail -n 1 | awk '{print $4}'`
if [ $SWAP -lt 1 ]; then
	echo " SWAP utilization is very low"
else
	echo " swap is good"
fi

#END#
