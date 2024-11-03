#!/bin/bash
ser=vsftpd
for i in `cat hosts`
do
read -sp " Enter your sudo password for $i: " SUDO_PASS
echo 
echo " checking the status of $ser in $i"
ser_status=$(echo "$SUDO_PASS" | sudo -S systemctl  is-active $ser)

if [ "$ser_status" != "active" ]; then
	echo "$ser is not running. attempting to restart.."
	echo "$SUDO_PASS" | sudo -S systemctl restart $ser
else
	echo " $ser is good"
fi
done




