package kata

// Executes one pass in the bubble sort algorithm.
func BubblesortOnce(numbers []int) []int {
	// arrays with 0 or 1 items could not be sorted
  n := len(numbers)
	if n < 2 {
		return numbers
	}
	// store result in a new array
	result := make([]int, n)
	// use a,b as current pair to sort
	a := numbers[0]
	b := numbers[1]
	for i := 2; i < n; i++ {
		if a < b {
			result[i-2] = a
			a = numbers[i]
		} else {
			result[i-2] = b
			b = numbers[i]
		}
	}
	// array numbers are read, store the remaining pair a,b in the result
	if a < b {
		result[n-2] = a
		result[n-1] = b
	} else {
		result[n-2] = b
		result[n-1] = a
	}
	return result
}
