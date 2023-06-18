# Returns the corrected string by the rule 5->S, 0->O, 1->I.
correct <- function(string) chartr("501","SOI",string)  
