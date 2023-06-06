# Count the number of characters more than 1-time in the text.
# Handels characters case insensitive.
duplicate_count <- function(text){
  # Convert all letters to lower case to ignore the case in the input text.
  # Convert to characters from the (multibyte) string.
  char_data <- strsplit(tolower(text), NULL, fixed=TRUE)
  # Count the characters.
  char_frequency <- table(char_data)
  # Return number of factors with more than one occurrence.
  sum(char_frequency>1)
}
