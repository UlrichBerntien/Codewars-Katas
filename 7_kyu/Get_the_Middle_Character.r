# Returns the one or two characters in the middle of string.
get_middle <- function(s){
  # Number of characters in the string, UTF-8 save.
  len <- stringr::str_length(s)
  if( len < 3 ) return(s)
  stringr::str_sub(s, (len+1) %/% 2, (len+2) %/% 2 )
}
