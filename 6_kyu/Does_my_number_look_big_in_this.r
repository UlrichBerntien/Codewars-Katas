# Returns TRUE if num is a narcissistic number.
# see https://en.wikipedia.org/wiki/Narcissistic_number
armstrong <- function(num){
  if( num < 0 ) return(FALSE)
  digits <- as.numeric(unlist(strsplit(as.character(num),"",fixed=TRUE)))
  sum(digits**length(digits)) == num
}
