#!/bin/bash
GREEN='\033[0;32m'
NC='\033[0m'
echo -e "Please enter the work notes"
read -r ch
for i in `cat hosts`
do
	ssh -q $i <<EOF
echo $ch
echo " "
#echo -e "${GREEN}This is green text"
echo -e "${GREEN}"$(hostname)"$NC"
#hostname
echo " "
uptime
EOF
done

