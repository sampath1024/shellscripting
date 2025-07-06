#!/bin/bash
#adding text to file and  replacing script
echo " Adding entries to hosts file"
echo "IPADDRESS" | tee -a /etc/hosts
echo " File systems entries"
echo "UUID Mountpoint fstype options" | tee -a /etc/fstab

# replacing script
sed 's/node2/node1/g' /etc/hosts # Will replace string node1 to node2 in hosts file

