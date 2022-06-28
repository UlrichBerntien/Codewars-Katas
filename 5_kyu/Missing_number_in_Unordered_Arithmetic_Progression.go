package kata

// Returns min and max of the numbers in the array.
// Returns 0, 0 if the array is empty.
func minMax(data []int) (min, max int) {
	if len(data) == 0 {
		// Empty array return 0, 0
		return
	}
	min = data[0]
	max = data[0]
	// One iteration through the array to find min and max.
	for _, v := range data {
		if v < min {
			min = v
		} else if v > max {
			max = v
		}
	}
	return
}

// Find missing number in unordered arithmetic progression.
// The first and the last number is never missing!
func FindMissingNumber(seq []int) int {
	if len(seq) < 2 {
		panic("Invalid seq, needed at least 2 items")
	}
	min, max := minMax(seq)
	// delta between two numbers in the sequence.
	delta := (max - min) / len(seq)
	if delta == 0 {
		// Special case: constant sequence.
		return min
	}
	// An array to mark all numbers in the sequence.
	seen := make([]bool, len(seq)+1)
	// Mark all numbers in the array.
	for _, v := range seq {
		seen[(v-min)/delta] = true
	}
	// The missing number is not marked.
	for i, v := range seen {
		if !v {
			return min + i*delta
		}
	}
	panic("the function is buggy")
}
