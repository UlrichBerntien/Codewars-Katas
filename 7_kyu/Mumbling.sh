#!/bin/bash

# String mumbling function to train Bach string manipulation.
# Argument: a string "abc.."
# Result output: a string "A-Bb-Ccc-..."
accum () {
  if [[ $# -ne 1 ]]; then
    echo 'invalid arguments, call accum string' >&2 
    return
  fi
  local i j lower upper accu
  lower="${1,,}"
  upper="${1^^}"
  accu=''
  for (( i=0; i<${#lower}; i++ )); do
    accu="${accu}-${upper:$i:1}"
    l=${lower:$i:1}
    for (( j=0; j<i; j++ )); do
      accu="${accu}${l}"
    done
  done
  echo "${accu:1}"
}

accum "$1"
