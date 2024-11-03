#!/bin/bash
#purpose: To test while loop
#version: 1.0
#created date: Saturday 07 September 2024 08:18:56 PM IST
#modifiled date:
#author: Sampath
#START#
#!/bin/bash
count=1
while [ $count -le 5 ]
do
	echo "count: $count"
	((count++))
done

#END#
