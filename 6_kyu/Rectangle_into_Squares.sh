#!/bin/bash

sqInRect() {
    local length=$1
    local width=$2
    local result=''
    if [[ $length -eq $width ]]
    then
      # specical case: do nothing if the input is a square
      result='nil '
    else
    while [[ ($length -gt 0) && ($width -gt 0) ]]
    do
      if [[ $length -gt $width ]]
      then
        result="$result$width "
        (( length-=width ))
      else
        result="$result$length "
        (( width-=length ))
      fi
    done
    fi
    # remove the last unused separator
    echo "${result::-1}"
}

sqInRect $1 $2