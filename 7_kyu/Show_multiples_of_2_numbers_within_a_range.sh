#!/bin/bash
let "factor=$1*$2"
for (( x=factor; x <= $3; x+=factor )); do
    echo $x
done