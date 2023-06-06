# Returns result of operator applied to the arguments.
basic_op <- function(operator, ...) do.call(operator,list(...))
