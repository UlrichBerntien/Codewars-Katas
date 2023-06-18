# Finds longest set of consecutive strings.
# Argruments:
#    strarr - Vector of strings (character vectors)
#    k - Number of strings in the subset
# Returns:
#    Concated of the longest consecutive subset
longestConsec <- function (strarr, k) {
  # returns empty string if k is out of range
  if( k < 1 | length(strarr) < k )
    return("")
  # length of all string, count of characters (not count of bytes).
  l <- stringr::str_length(strarr)
  # length os all string pasted i:i+k, relative to the length of the strings 1:(k-1)
  lk <- cumsum(l[k:length(l)])
  lk[2:length(lk)] = lk[2:length(lk)] - cumsum(l[1:(length(l)-k)])
  # index of first maximum
  i <- which.max(lk)
  paste0(strarr[i:(i+k-1)],collapse="")
}
