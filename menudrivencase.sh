#!/bin/bash
#purpose: To check menu driven options
#version:1.0
#created date: Sunday 08 September 2024 11:35:12 AM IST
#modifiled date:
#author: Sampath
#START#
#!/bin/bash
echo "Select an option:"
echo "1. check disk space "
echo "2. check memory usage "
echo "3. reboot system"
echo "4. Exit"

read ch

case $ch in 
	1)
		df -h;;
	2)
		free -m;;
	3)
		echo " rebooting the system "
		sudo reboot;;
	4)
		echo " exiting "
		exit;;
	*)
		echo " Invalid option";;
esac

#END#
