#!/bin/bash
evaporator () {
    bc -ql <<< "
      days = l($3/100) / l(1-$2/100)
      scale=0
      (days+0.9999)/1"
}
evaporator "$1" "$2" "$3"