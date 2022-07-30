#!/usr/bin/env bash
#
# Find 5 digit pin for given MD5 hash
# Simple brute force method without any optimization
#
# Argument: MD5 hash
# Return to stdout: the 5 digit PIN code
#
for (( i=0; i < 100000; i++ ))
do
  hash="$(printf "%05d" $i | md5sum)"
  if [[ $hash =~ ^$1 ]]
  then
    printf "%05d\n" $i
    exit
  fi
done
