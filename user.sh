#!/bin/bash
echo "Enter the hostname"
read -r h
echo "Enter the user name to create"
read -r u
echo "Enter Home directory"
read -r d
echo "Enter the required permissions"
read -r p
ssh -q $h <<EOF
sudo useradd $u -d $d 
sudo chmod $p $d
EOF


