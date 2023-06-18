# Returns TRUE is all letters are at least one time in string s.
is_pangram <- function(s){
  tbl <- table(strsplit(tolower(s),"",fixed=TRUE))
  !any(is.na(tbl[letters]))
}
