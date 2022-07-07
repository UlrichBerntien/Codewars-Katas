package kata

// Return the integers sorted.
func minMax(a, b int) (min, max int) {
	if a < b {
		min = a
		max = b
	} else {
		min = b
		max = a
	}
	return
}

// Sum of all integers between a and b.
func GetSum(a, b int) int {
	// First and last integer to add
	first, last := minMax(a, b)
	// Number of integers to add
	n := last - first + 1
	// Gauss formula
	return n*first + (n*(n-1))/2
}
