library(stringr)

# Returns the input string without the vowels (aeiou). 
disemvowel <- function(string) str_remove_all(string,"[aeiouAEIOU]")
