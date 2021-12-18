#!/bin/bash

# input a string like 'NSSNE'
way=$1

old=''
# reduce the path until no improvement found
while [[ $old != $way ]]
do
  old=$way
  # remove all immediately reversed steps
  for stay in 'SN' 'NS' 'EW' 'WE'
  do
    way=${way//$stay/}
  done
done
echo $way
