#!/usr/bin/env bash

# Returns final weight of the dried potatoes.
# Arguments
#   p0: initial percent (1..100) of water
#   w0: initial weight
#   p1: final percent of water
# echoed return
#   truncated to integer#
Potatoes () {
    local p0=$1
    local w0=$2
    local p1=$3
    # dry mass T is constant
    # before:  T = w0 (1 - p0/100)
    # after:   T = w1 (1 - p1/100)
    # so it is w1 (1 - p1/100) = w0 (1 - p0/100)
    echo $(( ( w0 * (100 - p0) ) / (100 - p1) ))
}

Potatoes "$1" "$2" "$3"
