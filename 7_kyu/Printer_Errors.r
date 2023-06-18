# Returns summary "#erros/#all".
# where #all is the number of all messages (characters) in s
# and #errors are the number of messages, no a,b,c...,m.
# Numbers are decimal numbers in the returned string.
printerError <- function(s) {
  all <- nchar(s)
  errors <- nchar(gsub("[a-m]","",s))
  paste(errors,all,sep="/")
}
