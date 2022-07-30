#!/usr/bin/env bash
#
# Add up letters to one letter.
# Interpret a=1, b=2, ...
# Sum with cylic overflow interpretation.
# e.g. "aa" -> "b", "ay" -> "z", "az" -> "a"
#
alphabeticAddition () {
    # ensure all letters are lowercase
    local letters=${1,,}
    # use z as default input string
    letters=${letters:-z}
    local len_letters=${#letters}
    local alphabet=" abcdefghijklmnopqrstuvwxyz"
    local last_alphabet=$(( ${#alphabet}-1 ))
    local sum=0
    for (( i = 0; i < len_letters; i=i+1 )); do
        local c=${letters:$i:1}
        c=${alphabet%%["$c"]*}
        (( sum += ${#c} ))
        if [[ $sum -gt $last_alphabet ]]; then
            (( sum -= last_alphabet ))
        fi
    done
    echo "${alphabet:$sum:1}"
}

alphabeticAddition "$1"
