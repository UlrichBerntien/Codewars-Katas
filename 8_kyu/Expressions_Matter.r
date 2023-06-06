expression_matter <- function(a, b, c) max( c(a+b+c,a+b*c,a*b+c,a*b*c,(a+b)*c,a*(b+c)) )
                                                       