# Returns integer number with all decimal digigits ordered decreasing.
descending_order <- function(num){
  digits = unlist(strsplit(toString(num),"",useBytes=TRUE,fixed=TRUE))
  digits = sort.int(digits,decreasing=TRUE)
  as.integer(paste(digits,collapse=""))
}
