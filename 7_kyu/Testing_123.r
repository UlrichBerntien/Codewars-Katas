# Numbers the strings in lines by prefix "nummer: line-content".
number <- function(lines) {
  if( length(lines) < 1 ) return(lines)
  paste(seq_along(lines), lines, sep=": ")
}
