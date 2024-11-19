#!/bin/bash
echo "Enter the directoty to check"
read -r dir
echo "Enter the size"
read -r s
sudo find $dir -type f -size +$s -exec ls -lrth {} \; >>/tmp/consumingfiles

