#
# Convert number to reversed array of decimal digits.
#
digitize <- function(n) {
  stopifnot(is.numeric(n), n >= 0)
  v <- numeric(0)
  while (n > 0) {
    v <- append(v, n %% 10)
    n <- n %/% 10
  }
  if(length(v) > 0) v else c(0)
}