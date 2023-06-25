# String mumbling function.
# Argument: a string "abc.."
# Result output: a string "A-Bb-Ccc-..."
accum <- function(s){
  upper_chars <- tochars(toupper(s))
  lower_chars <- tochars(tolower(s))
  lower_chars <- stringr::str_dup(lower_chars,0:(length(lower_chars)-1))
  paste0(upper_chars,lower_chars, collapse="-")
}

# Splits a string (character vector) into a vector of characters (stored in character vectors).
tochars <- function(s) unlist(strsplit(s,"",fixed=TRUE))
