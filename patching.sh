#!/bin/bash
#Script for RHEL Patching and reboot
user="admin"
patch_dir="/tmp/patching"
function check ()
{
	while read -r i;
	do
		ssh -q $user@$i <<EOF
mkdir -p /tmp/patching
echo " Extratcing the available updates to temporary location $patch_dir/updates"
sudo yum check-update >> $patch_dir/updates
echo " Extratcing the available kernel updates to temporary location $patch_dir/kernelupdates"
cat $patch_dir/updates | grep kernel >> $patch_dir/kernelupdates
EOF
done < hosts
}
check 
function precheck ()
{
label="$1"
echo " Pre-requisites required before going for patching"
while read -r i;
do
        echo "Running $label-check on $i"
        ssh -q $user@$i bash <<EOF

mkdir -p /tmp/patching
echo "HOSTNAME: \$(hostname -f)" > $patch_dir/hostname_$label
df -h > $patch_dir/filesystems_$label
cat /etc/fstab > $patch_dir/fstabentries_$label
ip a > $patch_dir/ipaddress_$label
free -g > $patch_dir/memory_$label
top -b -n 1 > $patch_dir/cpu_$label
EOF
done < hosts
}
precheck pre

while read -r i; do
    echo "Server $i is going for patch and reboot"
    ssh -q $user@$i bash <<EOF
mkdir -p /tmp/patching
sudo yum update -y > "$patch_dir/patch_log"
EOF
done < hosts
precheck post
echo " Validating the difference between pre and post patch"
function compare_sysinfo () {
    while read -r i; do
        echo "Comparing outputs for $i"
        ssh -q "$user@$i" bash <<EOF
echo "===== $i: File system changes ====="
diff "$patch_dir/filesystems_pre" "$patch_dir/filesystems_post"

echo "===== $i: Memory changes ====="
diff "$patch_dir/memory_pre" "$patch_dir/memory_post"

echo "===== $i: Fstab changes ====="
diff "$patch_dir/fstabentries_pre" "$patch_dir/fstabentries_post"

echo "===== $i: ipaddress changes ====="
diff "$patch_dir/ipaddress_pre" "$patch_dir/ipaddress_post"

EOF
    done < hosts
}
compare_sysinfo
