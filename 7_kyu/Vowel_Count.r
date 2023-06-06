library(stringr)

# Counts number of vowels (aeiou) in the input string.
get_count <- function(input_str) str_count(input_str,"[aeiouAEIOU]")
