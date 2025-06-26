#!/bin/bash
#script to verify the logs in remote server
user=sampath
echo -e "Please enter the log path(inclde /) to troubleshoot"
read -r logpath
for i in `cat hosts`
do
        ssh -q $user@$i <<EOF
sudo grep error $logpath | tail -n 5
EOF
done
