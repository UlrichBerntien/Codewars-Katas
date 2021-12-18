#!/bin/bash
race() {
    local vd=$(( $2-$1 ))
    if [[ $vd -gt 0 ]]; then
        local distance=$3
        local result=''
        for i in 1 2 3; do
            let time=distance/vd
            let 'distance=60*(distance-time*vd)'
            result="$result$time "
        done
        echo $result
    else
        echo '-1 -1 -1'
    fi
}
race $1 $2 $3