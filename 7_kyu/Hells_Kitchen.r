# Translates the sentence arg in the Gordon Ramsay language.
gordon <- function(arg) gsub("(\\S*)", "\\1!!!!", chartr("AEIOU", "@****", toupper(arg)))
