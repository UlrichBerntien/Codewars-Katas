flip <- function(d, a) {
  if( d != 'R' && d != 'L' )
    stop("argument d invalid")
  sort(a, decreasing=d == 'L')
}
