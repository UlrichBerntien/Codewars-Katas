# Returns numbers without the minimum.
# If there are several minimum values, only the first minimum value is filtered out.
remove_smallest <- function(numbers) numbers[-which.min(numbers)]
