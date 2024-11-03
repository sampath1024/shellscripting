#!/bin/bash
#set -eo pipefail
#for i in `cat hosts`
#do
	#echo " Current swap utilization on "$i" is"
	#ssh -q  $i <<EOF

#echo "Swap utilization values: "
#echo " "
#free -g
#echo "Top memory consuming processes: "
#echo ""
#top -b -o +%MEM -n 1 | head -n 12 | tail -n 5 
#EOF
#done

function login () {
	for i in `cat hosts`
	do
	echo " Current swap utilization on "$i" is"
	ssh -q  $i 
done
	#echo "Swap utilization values:"
	#echo " "
	#free -g
	#echo "Top memory consuming processes: "
	#echo " "
	#top -b -o +%MEM -n 1 | head -n 12 | tail -n 5

}

function swap () {
	login $i <<EOF
	echo "Swap utilization values on $i:"
	echo " "
	free -g
	echo "Top memory consuming processes in $i: "
	echo " "
	top -b -o +%MEM -n 1 | head -n 12 | tail -n 5
EOF
}
function disk () {
	login $i <<EOF
DISK=`df -h /var | tail -n 1 | awk '{print $5}' | sed 's/%/ /g'`
	echo $DISK
EOF
login &
disk &
wait
}
function check_all_factors () {
	login &
	swap &
	disk &
	wait
}





#wait
