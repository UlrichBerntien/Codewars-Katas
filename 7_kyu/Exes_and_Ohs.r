library(stringr)

# Returns true if count of "x" and count of "o" in the string s are equal.
# Compare is case insensetive.
xo <- function(s) {
  s = str_to_lower(s)
  str_count(s,fixed("x")) == str_count(s,fixed("o"))
}
