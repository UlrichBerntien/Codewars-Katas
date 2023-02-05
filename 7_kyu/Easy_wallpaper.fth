\ Inverse rotation on floating point stack
: frot- ( f1 f2 f3 - f3 f1 f2 )
  frot frot
;


\ 2dup floating point stack
: f2dup ( f1 f2 – f1 f2 f1 f2 )
  fover fover
;


\ Round up to next greater floating point value
: fceil ( f - f )
  fnegate floor fnegate
;


\ Replaces the two top floats by 0 if one is zero.
\ e.g. 1e 0e - 0e 0e, or
\      1e 2e - 1e 2e
: fzero2 ( r1 r2 - r1 r2 )
  f2dup f* f0= if
    fdrop fdrop 0e fdup
  then
;


\ Calculate needed count of wallpaper rolls plus 15%
\ One roll: 10m long, 0.52m width
\ Arguments floats: height length width of the room
\ Returns 0 if height or length or width is 0
: wallpaper ( rl rw rh -- n )
  frot-                     \ now on float stack: rh rl rw
  fzero2                    \ return 0 if length or width is zero
  f+ f2*                    \ length of all walls
  f*                        \ area to fill
  0.22115384615384615e f*   \ * 1.15/10m/52cm
  fceil f>s                 \ round up
;
