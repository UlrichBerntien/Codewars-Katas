# Returns the sentence sorted by numbers in the words.
your_order <- function(sentence){
  # The word in the sentence
  words <- unlist(strsplit(sentence,"\\s"))
  # The decimal numbers hidden in the words
  numbers <- extract_number(words)
  # Sorted by the value of the numbers 
  paste0(words[order(numbers)],collapse=" ")
}

# Converts the decimal number in the word to integer.
# Ignores all non-digits, e.g. "1to4" = 14.
extract_number <- function(word) as.integer(gsub("\\D","",word))
