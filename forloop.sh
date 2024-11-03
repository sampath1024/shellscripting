#!/bin/bash
#purpose: to test for loop
#version:1.0
#created date: Saturday 07 September 2024 08:23:49 PM IST
#modifiled date:
#author: Sampath
#START#
for i in `cat hosts`
do
	ping -c 1 $i > /tmp/pingresults
	
valid=`echo $?`
if [ $valid -gt 1 ]; then
	echo " $i host is not reachable"
else
	echo " $i host is reachable"
fi
done


	
#END#
