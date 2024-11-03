#!/bin/bash
#purpose: To check IFS field
#version:1.0
#created date: Wednesday 11 September 2024 06:49:57 PM IST
#modifiled date:
#author: Sampath
#START#
LINE=`cat /etc/passwd | awk "{print $1}"`
IFS= :
echo " value is $LINE"

#END#
