#!/bin/bash
SERVERS=("192.168.29.20")
#LOG_FILE="test_unlock_log_$(date +%F).log"
USERS=("test" "test1")
#echo " FS check - $(date)" | tee -a "$LOG_FILE"
for SERVER in "${SERVERS[@]}"; do
        echo -e "\n--- Connecting to $SERVER ---"
        FS_OUTPUT=$(ssh "$SERVER" "df -h | grep run")
        echo "$FS_OUTPUT" | while read -r line ; do
        FS_AVAIL=$(echo "$line" | awk '{print $4}')
        FS_NAME=$(echo "$line" | awk '{print $1}')
        NUMERIC_VALUE=$(echo "$FS_AVAIL" | grep -oE '[0-9]+')
        UNIT=$(echo "$FS_AVAIL" | grep -oE '[MG]')
if [[ "$UNIT" == "G" ]]; then
            AVAIL_MB=$((NUMERIC_VALUE * 1024))  # Convert GB to MB
        else
            AVAIL_MB=$NUMERIC_VALUE  # Already in MB
        fi
#echo "$FS_NAME - $FS_AVAIL available" | tee -a "$LOG_FILE"
if [[ "$AVAIL_MB" -lt 1000 ]]; then
            ALERT_MSG=" ALERT: $FS_NAME on $SERVER has less than 1GB free space! ($FS_AVAIL available)"
            #echo "$ALERT_MSG" | tee -a "$LOG_FILE"
fi
    done
echo "Unlocking the users"
USERS=("test" "test1")

for SERVER in "${SERVERS[@]}"; do
    echo -e "\n--- Connecting to $SERVER ---"

    for USER in "${USERS[@]}"; do
        ssh "$SERVER" "sudo passwd -u $USER"
        if [[ $? -eq 0 ]]; then
            echo "✅ Successfully unlocked $USER on $SERVER"
        else
            echo "❌ Failed to unlock $USER on $SERVER"
        fi
    done
done
done
echo -e "\n Script Execution Completed - $(date)"
