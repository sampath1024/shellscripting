#!/bin/bash
# Prompt for sudo password once
ser=vsftpd
echo "Enter sudo password:"
read -s SUDO_PASS
# Loop through all the servers
for i in `cat hosts`
do
  echo "Restarting $ser on $i..."
  
  # Restart the service on the remote server using SSH
 sshpass -p "SUDO_PASS"  ssh -q  $i "echo $SUDO_PASS | sudo -S systemctl restart $ser"
 #checking the status of service
if [ $? -eq 0 ];then
   echo "Successfully restarted $ser on $i"
  else
    echo "Failed to restart $ser on $i"
 fi
done
