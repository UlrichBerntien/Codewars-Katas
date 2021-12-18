#!/bin/bash
nbDig() {
    local counter=0
    local idx
    for (( idx=0; idx<=$1; idx++ )); do
        local number=$((idx**2))
        local rest=${number//$2/}
        let counter+=${#number}-${#rest}
    done
    echo $counter
}
nbDig $1 $2