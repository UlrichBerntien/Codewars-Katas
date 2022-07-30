#!/usr/bin/env bash
#
# Reverse the input string.
# And suppress digit 0 at returned string begin
#
reverse () {
  shopt -s extglob
  # strip trailing spaces and '0'
  local str="${1%%+( )}"
  str="${str%%+(0)}"
  shopt -u extglob
  local strLen=$#1
  # Output the string in reverse order
  local i
  for (( i=strLen-1; i >= 0; i-- )); do
    echo -n "${str:$i:1}"
  done
  # Terminate the result be newline
  echo ''
}

reverse "$1"
