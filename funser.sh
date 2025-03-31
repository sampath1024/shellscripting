#!/bin/bash
echo -e "Please enter the service name"
read -r SERVICE
echo -e "Please mention the config file location(Include '/' as well)"
read -r CONFIG
CHECKSUM_FILE="/tmp/$SERVICE"_checksum
getchecksum () {
        sha256sum "$CONFIG" | awk '{print $1}'
}

if [ ! -f "$CHECKSUM_FILE" ]; then
        getchecksum > "$CHECKSUM_FILE"
fi

while true; do
        sleep 10

        NEWCHECKSUM=$(getchecksum)
        OLDCHECKSUM=$(cat "$CHECKSUM_FILE")

        if [ "$NEWCHECKSUM" != "$OLDCHECKSUM" ]; then
                echo "$(date): config file changed, restating $SERVICE...."
                sudo systemctl restart "$SERVICE"
        else
                echo "$(date): no change in config file"

                echo "$NEWCHECKSUM" > "$CHECKSUM_FILE"
                fi
        done
