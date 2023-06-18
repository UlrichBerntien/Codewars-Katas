# Return string with characters 1-4 replaced by 0 and characters 5-9 replaced by 1.
fake_bin <- function(x) gsub("[5-9]", "1", gsub("[1-4]", "0", x) )
