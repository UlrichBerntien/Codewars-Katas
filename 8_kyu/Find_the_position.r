# Returns answer to the question of the position in the alphabet.
position <- function(letter){
  # WARNING: Needs a characters a..z in the character set in the "typical order".
  i <- 1L + ord(letter) - ord("a")
  paste0("Position of alphabet: ", i) 
}

# Position of the lowercase letter in the character set.
ord <- function(c) as.integer(charToRaw(tolower(c)))
