#!/bin/bash
#purpose: To get details from remote server
#version:1.0
#created date: Thursday 12 September 2024 06:31:49 PM IST
#modifiled date:
#author: Sampath
#START#
#command="df-h"
#username="admin"
for i in `cat hosts`
do
       	echo ""Utilization on z$i": `ssh $i -q df -h `"

done
#END#
