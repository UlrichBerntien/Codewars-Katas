# Calculates the number of natural numbers blow limit which are multiples of 3 or 5.
solution <- function(limit){
  last = limit - 1
  # All multiples of 3: 1*3 + 2*3 + 3*3, ...
	# + all multiples of 5: 1*5 + 2*5 + 3*5, ...
	# - all multiples of 3*5=15: 1*15 + 2*15 + 3*15, ...
	3*gauss(last %/% 3) + 5*gauss(last %/% 5) - 15*gauss(last %/% 15)
}

# Sum of the natural numbers upto n.
# Sum of 1,2,3,...,n with Gauss formula.
gauss <- function(n) ifelse( n < 1, 0, (n*(n + 1)) %/% 2)
