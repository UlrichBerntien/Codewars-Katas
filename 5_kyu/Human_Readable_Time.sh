#!/bin/bash

# Format time as HH:MM::SS
# Argument: time in seconds
format_HHMMSS () {
  if [[ $# -ne 1 ]]; then
    # error case: not one argument
    echo 'invalid args, call: format_HHMMSS second' >&2
    return
  fi
  local h m s
  (( s = $1 ))
  (( m = s / 60 ))
  (( h = m / 60 ))
  (( s %= 60 ))
  (( m %= 60 ))
  printf '%02d:%02d:%02d' $h $m $s
}

format_HHMMSS $*