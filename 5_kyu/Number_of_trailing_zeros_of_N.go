package kata

// Minmum of 2 integers.
func min(a, b int) int {
	if a < b {
		return a
	} else {
		return b
	}
}

// Returns the number of primefactor f in n!
func factorCount(n, f int) int {
	counter := 0
	for potencies := f; potencies < n; potencies *= f {
		counter += n / potencies
	}
	return counter
}

func Zeros(n int) int {
	// The number auf traling zeros in n!
	// Is the number of factor 10 in n!
	// Counting the prime factors 2 and 5 in n!
	// and calulation the count factor 10 in n!
	return min(factorCount(n, 2), factorCount(n, 5))
}
