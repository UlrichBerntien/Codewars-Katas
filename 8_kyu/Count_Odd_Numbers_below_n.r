# Count of odd numbers below n
odd_count <- function(n) ifelse(n < 1, 0, n %/% 2)
