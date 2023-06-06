# Returns string with each character doubled, e.g. "ab" -> "aabb".
double_char <- function(str) gsub('(.)','\\1\\1',str)