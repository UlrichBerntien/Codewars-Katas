# Returns sum of the lowest two integers.
sum_two_smallest_numbers <- function(numbers) sum( sort.int(numbers,partial=1:2)[1:2] )
