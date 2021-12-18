#!/bin/bash
arg=${1// /}
if [[ "${arg:0:1}" = '-' ]]; then
  echo "${arg:1}"
elif [[ "$arg" = "0" ]]; then
  echo "0"
else
  echo "-${arg//+/}"
fi