#!/bin/bash
n=$1
n=$1
counter=0
while [[ n -ne 0 ]]; do
	if (( (n & 1) != 0 )); then
		counter=$((counter+1))
	fi
	n=$((n >> 1))
done
echo $counter
