#!/usr/bin/env bash
# String manipulation fun.

# Reverse string order "abc" -> "cba"
revString () {
  local str="$1"
  local strLen=${#str}
  for (( i=strLen-1; i >= 0; i-- )); do
    echo -n "${str:$i:1}"
  done
  echo ''
}

# String Reversing, Changing case, etc.
revInvAndRevInvAndInv () {
  local invA="${1~~}"
  local invB="${2~~}"
  local revInvA revInvB
  revInvA="$(revString "$invA")"
  revInvB="$(revString "$invB")"
  echo "${revInvB}@@@${revInvA}${invA}"
}

revInvAndRevInvAndInv "$1" "$2"
