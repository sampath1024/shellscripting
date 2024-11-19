#!/bin/bash
touch  /tmp/ping.log
LOG_PATH="/tmp/ping.log"
echo "enter the server name to check the connectivity status"
read -r ch
ping_status="ping $ch -c 1"
eval $ping_status >>/dev/null
if [[ $? -ne 0 ]];
then
	echo " server is not reachable" >> $LOG_PATH
else
	echo " server is reachable" >> $LOG_PATH
fi


