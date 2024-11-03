#!/bin/bash
#purpose:testing logical operators
#version: 1.0
#created date: Friday 06 September 2024 08:32:46 PM IST
#modifiled date:
#author: Sampath
#START#
#!/bin/bash
echo -e " please enter marks in MATHS : \c"
read -r m
echo -e " please enter marks in PHYSICS: \c"
read -r p
echo -e " please enter marks in chemistry: \c"
read -r c
if  [ "$m" -gt 35 ] || [ "$p" -gt 35 ] || [ "$c" -gt 35 ];then
	echo " you are passed in maths exam"
else
	echo " you are failed"
fi

#END#
