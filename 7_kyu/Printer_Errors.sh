#!/bin/bash
printerError() {
    errors=0
    for (( i=0; i < ${#1}; i++ )); do
        if [[ "${1:$i:1}" > "m" ]]; then
            ((error++))
        fi
    done
    echo "$error/${#1}"
}
printerError $1