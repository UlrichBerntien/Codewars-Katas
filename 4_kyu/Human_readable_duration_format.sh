#!/bin/bash

function duration() {
  local temp=$1
  local seconds=$(( temp % 60 ))
  let 'temp/=60'
  local minutes=$(( temp % 60 ))
  let 'temp/=60'
  local hours=$(( temp % 24 ))
  let 'temp/=24'
  local days=$(( temp % 365 ))
  local years=$(( temp / 365 ))
  local result=""
  if [[ $years -eq 1 ]]; then
    result=', 1 year'
  elif [[ $years -gt 1 ]]; then
    result=", $years years"
  fi
  if [[ $days -eq 1 ]]; then
    result="$result, 1 day"
  elif [[ $days -gt 1 ]]; then
    result="$result, $days days"
  fi
  if [[ $hours -eq 1 ]]; then
    result="$result, 1 hour"
  elif [[ $hours -gt 1 ]]; then
    result="$result, $hours hours"
  fi
  if [[ $minutes -eq 1 ]]; then
    result="$result, 1 minute"
  elif [[ $minutes -gt 1 ]]; then
    result="$result, $minutes minutes"
  fi
  if [[ $seconds -eq 1 ]]; then
    result="$result, 1 second"
  elif [[ $seconds -gt 1 ]]; then
    result="$result, $seconds seconds"
  fi
  if [[ -z $result ]]; then
    result="now"
  else
    result="${result:2}"
  fi
  if [[ "$result" =~ ',' ]]; then
    result="${result%,*} and${result##*,}"
  fi
  echo "$result"
}
duration "$1"