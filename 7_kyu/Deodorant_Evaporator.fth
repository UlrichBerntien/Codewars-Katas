: evaporator ( content evap-per-day threshold -- result )
  s>f s>f drop
  \ FP-stack: threshold evap-per-day
  fswap 100e f/ flog
  \ FP-stack: evap-per-day log(threshold/100)
  fswap -100e f/ 1e f+ flog
  \ FP-stack: log(threshold/100) log(1-evap-per-day/100)
  f/ .9999999e f+
  \ FP-stack: log(threshold/100)/log(1-evap-per-day/100) up rounded
  f>s
  ;