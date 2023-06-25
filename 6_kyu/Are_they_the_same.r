# Checks if the vector a2 contains all number of vector a1 squared.
# The order of the items could be different.
# The values are all integers, compare is done with absolute limit 0.01.
comp <- function(a1, a2) {
  if( length(a1) != length(a2) )
    return(FALSE)
  # it is a**2 = (-a)**2, for fast compare use only the part 
  a <- sort(abs(a1))
  b <- sort(a2)
  # Values should be all integer values.
  # To avoid floating point rounding errors, use the 0.01 limit.
  !any( abs(a**2 - b) > 0.01 )
}
