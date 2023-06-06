# Calculates number of pages for n pages per m persons.
# Returns 0 if n or m is less then 0.
paperwork <- function(n, m) ifelse(n>0 && m>0, n*m, 0)
