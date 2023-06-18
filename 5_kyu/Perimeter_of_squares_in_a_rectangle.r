# Returns the total length of the first n+1 squares.
perimeter <- function (n) {
    sum_length <- 0    # sum of one edge length per square
    length <- c(0,1)   # edge length of square i-1 and square i
    for( i in 0:n ) {
        sum_length <- sum_length + length[2]
        length <- c(length[2], sum(length))
    }
    return( 4*sum_length )
}