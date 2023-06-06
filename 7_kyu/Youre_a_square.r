# Returns true if n is a perfect square number.
is_square <- function(n) n >= 0 && check.integer(n) && check.integer(sqrt(n))

# Return true if x has is an integer value.
check.integer <- function(x) abs(x) %% 1 < 1e-5
