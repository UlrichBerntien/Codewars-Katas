#!/bin/bash
declare -A letters
str="${1^^}"
for ((idx=0; idx < ${#str}; idx++)); do
    let 'letters[${str:idx:1}]++'
done
counter=0
for n in ${letters[@]}; do
    if [[ $n -gt 1 ]]; then
        let counter++
    fi
done
echo $counter