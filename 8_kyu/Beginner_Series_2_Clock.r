# Returns time h:m:s into milliseconds.
past <- function(h, m, s) 1000*(s+60*(m+60*h))
