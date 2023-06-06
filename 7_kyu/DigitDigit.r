suppressMessages(library(purrr))

# Returns a number pasted together from the decimal digits of num squared.
square_digits <- function(num)
  reduce( .x = digits(num), .f = function(accu,d) d*d + accu*ifelse(d>3,100,10), .init=0 )

# Converts number n into the value of its decimal digits.         
digits <- function(n) as.integer(strsplit(as.character(n),"")[[1]])
