# Return TRUE if the lines of length a,b,c can form a triangle.
is_triangle <- function(a, b, c) min(a,b,c) > 0 && sum(a,b,c) > 2*max(a,b,c)
