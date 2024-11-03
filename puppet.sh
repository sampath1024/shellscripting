#!/bin/bash
#purpose:
#version:
#created date: Monday 16 September 2024 06:00:11 PM IST
#modifiled date:
#author: Sampath
#START#
echo -e " Please enter the service name to check: "
read -r ser
echo "1. Select to view the status of service"
echo "2. Select to restart the service"

echo -e " select an option: "
read -r ch
case $ch in 
	1)
		echo "Enter your sudo password"
		read -s SUDO_PASS
		for i in `cat hosts`
do
        echo " $ser status on "$i" is"
echo "$service status is: "
echo " "
echo " "
sshpass -p "$SUDO_PASS" ssh -q "$i" "echo "$SUDO_PASS" | sudo -S systemctl status "$ser""
done;;

	2)
		echo " Enter your sudo password"
		read -s SUDO_PASS

		for i in `cat hosts`
		do
			echo "Restarting $ser on $i"
			sshpass -p "SUDO_PASS" ssh -q $i "echo $SUDO_PASS | sudo -S systemctl restart $ser"
			#checkign the command status
			if [ $? -eq 0 ];
			then
				echo "Succesfully restarted $ser on $i"
			else
				echo "Failed to restart $ser on $i"
			fi
		done;;
esac






#END#
