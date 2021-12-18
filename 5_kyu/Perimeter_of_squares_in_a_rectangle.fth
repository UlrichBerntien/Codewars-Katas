: roll3 ( x0 x1 x2 x3 -- x1 x2 x3 x0 )
  3 roll
;

: pick3  ( x0 x1 x2 x3 -- x0 x1 x2 x3 x0 )
  3 pick
;

: perimeter ( n -- result )
  0 1 0 roll3
  \ stack: s a b n
  begin dup 0>= while
    1-                  \ s a b n-1
    roll3 pick3 +       \ a b n-1 s+a
    2swap over + swap   \ n-1 s+a b+a a
    roll3               \ s+a b+a a n-1
  repeat
  \ s a b n
  drop drop drop
  4 *
;