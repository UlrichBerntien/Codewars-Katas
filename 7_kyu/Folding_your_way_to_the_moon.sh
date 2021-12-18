#!/bin/bash
bc -ql <<< "
distance=$1
if(distance <= 0) {
    print \"None\"
} else {
    folds=(l(distance)-l(0.0001))/l(2)
    if(folds < 0) {
        0
    } else {
        scale=0
        (folds+0.999999)/1
    }
}
"