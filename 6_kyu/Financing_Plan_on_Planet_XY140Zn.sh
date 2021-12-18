#!/bin/bash
finance() {
    local sum=0
    for i in $(seq 0 $1); do
        # guass sum formula (start+stop)*(stop-start+1)/2
        sum=$(( sum + (i*2+$1+i)*($1-i+1)/2 ))
    done
    echo $sum
}
finance $1