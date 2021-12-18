#!/bin/bash

# split the names by ';'
readarray -d ';' -t names <<< "$1"
for name in "${names[@]}"
do
  # split a name by ':'
  readarray -d ':' -t first_last <<< "$name"
  first=${first_last[0]}
  # remove trailing newline
  readarray -t last <<< "${first_last[1]}"
  # format as specified
  echo "(${last^^}, ${first^^})"
done |
sort |
tr -d '\n'