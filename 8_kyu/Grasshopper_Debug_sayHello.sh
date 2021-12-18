#!/bin/bash 

say_hello() {
    echo "Hello, $*"
}

say_hello "$1"