#!/bin/bash
#Script verifies package presence in remote server
user="sampath"
echo -e "Please enter the package to verify"
read -r package
while read -r i;
do
        ssh -q $user@$i<<EOF
if rpmquery $package > /dev/null 2>&1; then
echo $package is installed
else
echo $package is not installed
fi
EOF
done < hosts
