# Returns string s without character '!'.
remove_exclamation_marks <- function(s) gsub("!", "", s, fixed=TRUE)