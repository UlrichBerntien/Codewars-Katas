\ Find maximal reachable result of
\ "(a op b) op c" or "a op (b op c)"
\ with op plus or multiplication
: expression-matter { a b c -- x }
  a b c + +
  a b c * *
  max
  a b c + *
  max
  a b c * +
  max
  c a b + *
  max
  c a b * +
  max
;
