: tank-vol ( h d vt -- v )
  s>f s>f s>f
  \ float-stack: vt d h
  fswap f2/ f/ 1e fswap f- facos f2*
  \ float-stack: vt acos(1 - h/d/2) * 2
  \ float-stack: vt k
  fdup fsin f- f* f2/ pi f/
  \ float-stack: vt * (k - sin(k))/2/Pi)
  floor f>s
;
