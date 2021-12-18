#!/bin/sh

dad_years_old=$1
son_years_old=$2

n=$(( dad_years_old-2*son_years_old ))
if [[ $n -ge 0 ]]; then
  echo $n
else
  echo $((-n))
fi