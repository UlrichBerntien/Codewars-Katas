# Return string of all characters sorted and unique
longest <- function(...) {
  count <- table(tochars(fullpaste(...)))
  fullpaste(names(count))
}

# Paste all strings without separators
fullpaste <- function(...) paste0(...,collapse="")

# Splits string into characters.
tochars <- function(s) strsplit(s,"",fixed=TRUE)
