package kata

import "math"

// Returns the index of the smallest number that is larger than the element at the given index.
// Returns -1 if there is no such index.
func LeastLarger(a []int, i int) int {
	limit := a[i]
	// Initialise with maximal value.
	// If this value or a smalller value is in the array,
	// the the minIndex is set.
	min := math.MaxInt
	minIndex := -1
	for index, value := range a {
		// Use <= compare because value maxint must change the maxIndex.
		if limit < value && value <= min {
			// Found a new minimal value above limit
			min = value
			minIndex = index
		}
	}
	return minIndex
}
