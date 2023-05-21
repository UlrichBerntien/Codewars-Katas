# Returns the number of vowels (aeiou) in s.
getcount(s::String) = count(isvowel,s)

# Returns true if c is a vowel (aeiou).
isvowel(c::Char) = c ∈ "AEIOUaeiou"
