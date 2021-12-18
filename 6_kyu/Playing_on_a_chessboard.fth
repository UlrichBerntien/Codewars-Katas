: game ( n -- numerator denominator )
  \ result is n*n/2
  dup *
  dup 1 and if
      \ n is even: reduce the fraction.
      2
  else
      2/ 1    
  endif
  ;