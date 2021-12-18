: f ( x -- float result )
  \ Approximation of sqrt(1+x)-1 for x near 0:
  \ taylor serie up to x^4
  fdup
  -0.0390625e f*
  +0.0625e f+ fover f*
  -0.125e f+ fover f*
  +0.5e f+ f* ;
