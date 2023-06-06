# Calculates average, the arithmetic mean value.
# Returns 0 if the vector is empty.
find_average <- function(vec) ifelse(length(vec)>0,mean(vec),0)
