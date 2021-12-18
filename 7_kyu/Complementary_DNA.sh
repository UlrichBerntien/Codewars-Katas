#!/bin/sh
x=${1,,}
x=${x//a/T}
x=${x//t/A}
x=${x//c/G}
x=${x//g/C}
echo $x