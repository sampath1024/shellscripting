#!/bin/bash
#function to check the package status
user="sampath"
echo -e "Please enter the software name to check"
read -r package
function software ()
{
        for i in `cat hosts`
        do
           ssh -q $user@$i <<EOF
if rpm -q $package > /dev/null 2>&1; then
echo $package exists
else
echo $package not exists
fi
EOF
done
}
software
