# Returns sum of integers between a and b, including a and b.
get_sum <- function(a, b){
	# First and last integer to add
	first <- min(a,b)
  last <- max(a, b)
	# Number of integers to add
	n <- last - first + 1
	# Gauss formula
	n*first + (n*(n-1))/2
}