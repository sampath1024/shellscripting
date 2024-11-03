#!/bin/bash
#purpose:To test functions
#version:1.0
#created date: Sunday 08 September 2024 07:20:40 PM IST
#modifiled date:
#author: Sampath
#START#
function takebackup () {
	if [ -f $2 ]; then
		BACKUP="/home/admin/shellscripting/$(basename ${2}).$(date +%F).$$"
		echo "backing up $2 to $BACKUP"
		cp $2 $BACKUP
	fi

}
takebackup /etc/hosts /etc/resolv.conf
if [ $? -eq 0 ]; then
	echo "backup success"
	fi


#END#
