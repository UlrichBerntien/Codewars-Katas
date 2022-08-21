package kata

// Generates array with [1*b, 2*b, ... n*b] with n*b <= limit.
func FindMultiples(b, limit int) []int {
	// Allocate array to hold all items
	result := make([]int, 0, limit/b)
	// Fill in the values b, 2b, ...
	it := b
	for it <= limit {
		result = append(result, it)
		it += b
	}
	return result
}
