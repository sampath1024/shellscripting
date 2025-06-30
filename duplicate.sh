#!/bin/bash
echo -e "Please enter the directory to check"
read -r dir
declare -A file_map
while IFS= read -r -d $'\0' file; do
    size=$(stat -c '%s' "$file")
    base=$(basename "$file")
    name="${base%.*}"
    key="${size}|${name}"

    if [[ -n "${file_map[$key]}" ]]; then
        echo "Possible duplicate found: ${file_map[$key]} and $file"
    else
        file_map[$key]="$file"
    fi
done < <(find "$dir" -type f -print0)
