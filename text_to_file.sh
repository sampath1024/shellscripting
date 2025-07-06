#!/bin/bash
#Appending text to file or sending error to a file
echo " Exporting file system information"
echo "=================================="
df -h > /tmp/fsinfo
echo " Exported"
