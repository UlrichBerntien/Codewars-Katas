sum_mul <- function(n, m) {
  if( n > 0 && m > 0 ) {
    count <- (m-1) %/% n
    n * count * (count+1) / 2
  } else
    "INVALID"
}