#!/bin/bash
#purpose:To copy files to multiple servers
#version:1.0
#created date: Wednesday 02 October 2024 01:44:16 AM IST
#modifiled date:
#author: Sampath
#START#
echo -e "Please enter the file path to copy"
read -r src
echo -e "please enter the destination path"
read -r dest
for i in `cat hosts`
do
sudo -S scp -pr $src $user@$i:$dest
ssh -q $i <<EOF
sudo -S mv $src /tmp
cd /tmp
sudo sh $src >> /tmp/testtttt
EOF
done

#END#
