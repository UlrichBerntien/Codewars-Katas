# Returns sum of all the decimal digits in the integer n.
# Calculation is repeated until the resulting number is less than 10.
digital_root <- function(n) ifelse( n > 0, (n - 1) %% 9 + 1, 0)
