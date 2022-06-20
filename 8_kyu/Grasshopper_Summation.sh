#!/usr/env bash

# Gauss Sum Formula 1, 2, .. argument
# Argument: positive integer
# Result to output: Sum of all integers up to argument
gauss_summation() {
  echo $(( ($1*($1+1))/2 ))
}

gauss_summation "$1"
