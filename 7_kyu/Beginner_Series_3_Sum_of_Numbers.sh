#!/bin/bash

# Sum all integers between the given to intergers
# Arguments: a b, two integers
# Result output: Sum of all integers min,min+1,..,max
sum_integers () {
  if [[ $# -ne 2 ]]; then
    # error case: invalid number of arguments
    echo "call: sum_integers a b" >&2
    return
  fi
  # order the arguments
  local max, min
  if [[ $1 -lt $2 ]]; then
    min=$1
    max=$2
  else
    max=$1
    min=$2
  fi
  # with gauss summation formula
  echo $(( ((max+min)*(max-min+1))/2 ))
}

sum_integers $*
