#!/bin/bash
echo "Enter the hostname to check"
read -r h
ssh -q $h <<EOF
up=$(awk '{print $1}'/proc/uptime | cut -d. -f1)
echo $up  
EOF
