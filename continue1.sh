#!/bin/bash
#purpose:
#version:
#created date: Sunday 08 September 2024 01:06:55 PM IST
#modifiled date:
#author: Sampath
#START#
opt="y"
while [ $opt=y -o $opt=Y ] 
do
	echo -e "please enter a number: \c"
	read -r num
	if [ $num -le 50 ]; then
		sq=`expr $num \* $num`
		echo "square of provided number $num is $sq"
		else
			echo " Number not in the range"
	fi
	echo -e " Do you wish you continue [Y/N]: \c"
	read -r wish
	if [ $wish = y -o $wish = Y ]; then
		continue
	else
		echo "Thank you for exiting"
		exit
	fi
done

#END#
