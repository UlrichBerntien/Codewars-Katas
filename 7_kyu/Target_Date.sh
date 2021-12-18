#!/bin/bash
timeoffset=$(date -d2016-01-01 '+%s') 
bcScript="
  start = $1
  target = $2
  base = 1 + $3 / 36000
  days = l(target/start) / l(base)
  scale = 0
  rounded = (days+0.999999)/1
  rounded*86400 + $timeoffset"
result=$(bc -ql <<< $bcScript)
printf '%(%F)T' $result