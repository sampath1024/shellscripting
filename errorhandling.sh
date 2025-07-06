#!/bin/bash
#script to handle errors
echo " Verifying errors in shell script"
df -h
df -x >>2&>1
echo "==================="
echo " Checking exit status"
cp file1.txt /some/dir/
if [ $? -ne 0 ]; then
    echo "Error copying file"
    exit 1
fi
echo "Completed"
echo "======================"
echo "Exit on error"
#!/bin/bash
set -e

cp file1.txt /some/dir/
echo "File copied successfully"
echo "========================"

