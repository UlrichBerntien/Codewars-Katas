get_grade <- function(a, b, c) {
  i <- min( 5, max( 1, ( mean(c(a,b,c)) - 40 ) %/% 10 ) )
  substr( "FDCBA", i, i )
}