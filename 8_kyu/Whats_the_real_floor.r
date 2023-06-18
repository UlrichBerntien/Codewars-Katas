# Returns european floor number for the given american floor number.
# US: ground floor is 1 (not 0) and floor 13 is skipped.
get_real_floor <- function(n) n - (n > 0) - (n > 12)
