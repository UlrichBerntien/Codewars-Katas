# Returns length of shortest word.
# Words are space separated parts in the string s.
find_short <- function(s){
  words <- stringr::str_split(s, "\\s", simplify=TRUE)
  min(stringr::str_length(words))
}
