is_vow <- function(a){
  if( any(a %in% vowel_codes) )
    plyr::mapvalues(a, from=vowel_codes, to=vowels)
  else
    a
 }

# Convert character c into ASCII code number.
asc <- function(c) strtoi(charToRaw(c),16L)

# All lower case vowels
vowels <- c("a","e","i","o","u")

# ASCII codes of all lower case vowels
vowel_codes <- sapply(vowels, asc)
