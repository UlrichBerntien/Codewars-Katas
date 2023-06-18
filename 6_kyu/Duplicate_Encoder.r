# Returns a string with the char '(' to indicate a single char in the word,
# and ')' to indicate chars used twice or more in the word.
# Ignores upper/lower case.
duplicate_encode <- function(word) {
  word <- tolower(word)
  counts <- table(strsplit(word,"",fixed=TRUE))
  once <-paste_all( names(counts)[counts==1] )
  some <- paste_all( names(counts)[counts>1] )
  chartr(paste_all(once,some),paste_all(strrep("(",nchar(once)),strrep(")",nchar(some))),word)
}

# Pasts all arguments into one string without separators.
paste_all <- function(...) paste0(c(...),collapse="")
