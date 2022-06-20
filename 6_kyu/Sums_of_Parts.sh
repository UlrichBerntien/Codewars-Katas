#!/bin/bash

# Calculate the cummulative sum of all arguments.
# Arguments: one int or a list of ints "i1 i2 i3 ..."
# Result output: A list of sums "s1 s2 s3 ..."
#                with sI = sI + s[I+1] + .. + s[end]
sumsParts() {
  if [[ $# -lt 1 ]]; then
    # Special case empty argument
    echo '0'
    return
  fi
  # Split all arguments into one array
  local val=($*)
  # Sum over the items
  local accu=0
  # Collect the sums in the array result
  local result=()
  result[${#val[@]}]=0
  # Sum all items
  for (( i = ${#val[@]}-1; i >= 0; i-- ));
  do
    (( accu += val[i] ))
    result[i]=$accu
  done
  # Result to stdout
  echo "${result[@]}"
}

sumsParts "$1"
