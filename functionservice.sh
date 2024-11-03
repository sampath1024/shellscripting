#!/bin/bash
service=vsftpd
SERVICE_STATUS=$(systemctl is-active $SERVICE_NAME)
function ser () {
for i in `cat hosts`
do
        echo " $service status on "$i" is"
        ssh -q  $i <<EOF
echo "$service status is: "
echo " "
echo " "
systemctl status $service
EOF
done
}
ser

function res ()
{
#if [ echo $? -eq 0 ]
#then
#echo " Service is good"
#else
	echo "$service status is:"
echo "$SUDO_PASS" | sudo -S systemctl restart vsftpd
#fi
}
for i in `cat hosts`
do


res
#read -sp "enter your password:" SUDO_PASS
#echo "$SUDO_PASS" | sudo -S systemctl restart vsftpd
#continue
