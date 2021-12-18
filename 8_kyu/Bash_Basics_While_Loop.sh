#!/bin/bash

countToTwenty() {
  local count=0
  while ((count <= 20)); do
    echo "Count: $count"
    count=$((count+1))
  done
}

countToTwenty