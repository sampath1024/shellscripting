#!/bin/bash
#checking exit status of script
cp file.txt /tmp
if [ $? -ne 0 ]; then
	echo "Error copying the file"
	exit 1
fi

