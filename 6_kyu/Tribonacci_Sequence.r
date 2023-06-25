# Returns Tribonacci sequence of length n.
# It is item[i] = items[i-1]+items[i-2]+items[1-3].
tribonacci <- function(sig, n) {
  if( n <= 0 ) return(c())
  if( n <= length(sig) ) return(sig[1:n])
  r <- numeric(n)
  r[1:length(sig)] <- sig
  for( i in 4:n ) {
    r[i] <- sum(r[(i-3):(i-1)])
  }
  r
}
