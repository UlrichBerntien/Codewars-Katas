# Returns maximal and minimal value of the numbers.
# The numbers and the max/min values are space separated decimal numbers in strings.
high_and_low <- function(numbers){
  n <- sapply(strsplit(numbers,"\\s"), as.numeric)
  paste(max(n), min(n))
}
