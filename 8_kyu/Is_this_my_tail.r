#
# Returns TRUE if last character of body is the string tail, else returns FALSE.
#
correct_tail <- function(body, tail){
  stopifnot(is.character(body), is.character(tail))
  len <- nchar(body)
  substr(body, len, len) == tail
}