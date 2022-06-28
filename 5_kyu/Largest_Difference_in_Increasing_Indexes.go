package kata

// Take an array data of numbers.
// Returns the largest difference in indexes j - i such that data[i] <= data[j]
func LargestDifference(data []int) int {
	len := len(data)
	// Search start with maximal possible difference.
	for diff := len - 1; diff > 0; diff-- {
		for i := 0; i < len-diff; i++ {
			if data[i] <= data[i+diff] {
				// The first valid pair is found.
				// This is the maximal difference,
				// because all yet unchecked pairs have diff <= this value..
				return diff
			}
		}
	}
	// The loop returned without a pair found.
	return 0
}
