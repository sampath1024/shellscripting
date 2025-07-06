#!/bin/bash
#script for patching and reboot
while read -r i; do
	echo "=========================="
	echo "Updating packages on "$i"...."
	ssh "$i" <<EOF
sudo yum update -y
EOF
echo  "Select Yes/No if reboot required"
read -r choice
case $choice in 
	  Yes)
		  ssh -q "$i" "sudo reboot";;
	  No)
		  echo "No reboot required";;
          *)
		  echo "Invalid option"
		  ;;

esac
done < hosts

