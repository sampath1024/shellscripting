#!/bin/bash
#purpose: Testing relational operations
#version: 1.0
#created date: Friday 06 September 2024 08:16:30 PM IST
#modifiled date:
#author: Sampath
#START#
#!/bin/bash
echo -e " please enter a values: \c"
read -r a
echo -e " please enter another value: \c"
read -r b
test $a -lt $b;echo "$?"
test $a -le $b;echo "$?"

#END#
