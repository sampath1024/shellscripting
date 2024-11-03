#!/bin/bash
#purpose:copied from chatgpt
#version:
#created date: Thursday 12 September 2024 07:18:38 PM IST
#modifiled date:
#author: Sampath
#START#
#!/bin/bash

# Variables
REMOTE_USER="admin"
REMOTE_HOST="192.168.29.200"

# Prompt for the password
read -sp "Enter the password for $REMOTE_USER@$REMOTE_HOST: " REMOTE_PASSWORD
echo

# Command to collect file system information

COMMANDS="hostname && df -h && echo -e '\nDisk Usage:' && du -sh /home/admin"

# Use sshpass to pass the password and run SSH command on the remote server
sshpass -p "$REMOTE_PASSWORD" ssh -o StrictHostKeyChecking=no $REMOTE_USER@$REMOTE_HOST "$COMMANDS"

#END#
