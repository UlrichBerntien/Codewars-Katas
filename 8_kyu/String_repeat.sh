#!/bin/bash
repeat=$1
string=''
while (( repeat-- > 0 )); do
  string="$string$2"
done
echo "$string"