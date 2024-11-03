#!/bin/bash
#purpose: To check file or directory
#version: 1.0
#created date: Sunday 08 September 2024 11:23:24 AM IST
#modifiled date:
#author: Sampath
#START#
#!/bin/bash
echo -e "enter file or directory name : \c"
read -r file

case $file in
	/*)
		if [ -d "$file" ]; then
			echo " $file its a directory"
		elif [ -f "$file" ]; then
			echo " $file is a regular file "
		else
			echo " $file is something else "
		fi;;
	*)
		echo " please provide an absoulute path (starting with / .";;
esac

#END#
