#!/bin/bash
longest () {
  local acc=''
  for t in {a..z}; do
    if [[ $1 =~ $t ]] || [[ $2 =~ $t ]]; then
      acc="$acc$t";
    fi
  done
  echo "$acc"
}
longest "$1" "$2"