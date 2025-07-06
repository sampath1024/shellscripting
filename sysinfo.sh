#!/bin/bash
filename="sysinfo.csv"
echo "collecting basis info of server"
echo "Hostname,Date,OS,Kernel Version,Uptime" > "$filename"
hostname=$(hostname)
#date=$(date+"%Y-%M-%d %H-%M-%S")
date=$(date +"%Y-%m-%d %H:%M:%S")
kernel=$(uname -r)
uptime=$(uptime -p)
echo "$hostname,$date,$os,$kernel,$uptime" >> "$filename"
echo "Report exported to $filename"
