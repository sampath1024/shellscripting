#!/bin/bash
#purpose: To perform arithmetic operations
#version: 1.0
#created date: Friday 06 September 2024 07:57:32 PM IST
#modifiled date:
#author: Sampath
#START#
#!/bin/bash
### Using (( )) ##
#echo -e " please enter some value : \c"
#read -r a
#echo -e " please enter another value : \c"
#read -r b
#echo " sum of a and b is : $(($a+$))"
#echo " difference of a and b is : $(($a-$b))"
### using let command###
echo -e " please enter some value : \c"
read -r a
echo -e " please enter another value : \c"
read -r b
let sum=a+b
let diff=a-b
let product=a*b
echo $sum
echo $diff
echo $product

#END#

