# Solves the equation n over x = m, returns x for given m and n.
checkChoose <- function(m, n) {
  # Use the multiplicative formula to calculate the n over x values.
  # https://en.wikipedia.org/wiki/Binomial_coefficient#Multiplicative_formula
  x = 0
  n_over_x = 1
  # Use approximate comparison as floating point arithmetic causes rounding errors.
  # R supports only 32-bit integers. The gmp package (Multiple Precision Arithmetic)
  # is not available in this environment.
  while( n_over_x+0.5 < m & x <= n ){
    x = x + 1
    n_over_x = n_over_x *((n-x+1)/x)
  }
  ifelse( abs(n_over_x-m) < 0.5, x, -1)
}
