solve <- function(arr){
    count_unique <- function(arr) length(unique(arr))
    prod( sapply(arr, count_unique) )
}