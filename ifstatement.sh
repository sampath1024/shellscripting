#!/bin/bash
#purpose: To check if logic
#version: 1.0
#created date: Friday 06 September 2024 11:12:03 PM IST
#modifiled date:
#author: Sampath
#START#
#!/bin/bash
read -p " enter a file name:" str
if [ -z $str ]; then
	echo " string is empty "
else
	echo " string is not empty"

fi
#END#
