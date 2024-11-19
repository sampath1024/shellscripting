#!/bin/bash
echo "Enter the hostname to verify the memory info"
read -r ch
ssh -q $ch <<EOF
value=$(free -m | awk'/^Mem:/ {print \$4}')
echo $value
EOF

