solution <- function(n){
    below <- abs(n-1)
    common <- below %/% 15
    c(below %/% 3 - common, below %/%5 - common, common)
}