# Returns strings str without first and last character.
removeChar <- function(str) stringr::str_sub(str, 2, -2)
