#!/bin/bash
#purpose: To test case statement
#version: 1.0
#created date: Sunday 08 September 2024 11:06:27 AM IST
#modifiled date:
#author: Sampath
#START#
#!/bin/bash
echo " enter a day of the week"
read -r day
case $day in 
	Mon) 
		echo "start of the week";;
	Tue)
		echo "second day of the week";;
	Wed)
		echo "Third day of the week";;
	thu)
		echo "Almost there";;
	Fri)
		echo "weekend is near";;
	Sat|Sun)
		echo "Its weekend";;
	*)
		echo "Invalid input"
esac
#END#
