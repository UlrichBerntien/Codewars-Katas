package kata

// Collect all contiguous subsequences.
// Adds all non-positive and all non-negative contiguous numbers.
func collectSubsequences(source []int) []int {
	dest := make([]int, 0)
	sourceLen := len(source)
	for sourceIndex := 0; sourceIndex < sourceLen; {
		sum := source[sourceIndex]
		sourceIndex++
		mode := sum > 0
		if sum != 0 {
			// add all numbers with same sign and 0
			for sourceIndex < sourceLen && (source[sourceIndex] > 0 == mode || source[sourceIndex] == 0) {
				sum += source[sourceIndex]
				sourceIndex++
			}
			dest = append(dest, sum)
		}
		// else: skip 0 numbers
	}
	return dest
}

func MaximumSubarraySum(numbers []int) int {
	// try to reduce the array
	numbers = collectSubsequences(numbers)
	// max is at least 0 by definition of the kata
	max := 0
	numbersLen := len(numbers)
	// calculate the sum of all subsequences and take the maximum value
	for startIndex := 0; startIndex < numbersLen; startIndex++ {
		if numbers[startIndex] > 0 {
			sum := 0
			for index := startIndex; index < numbersLen; index++ {
				sum += numbers[index]
				if sum > max {
					max = sum
				}
			}
		}
		// else: a subsequence which starts with number < 0 could no have the maximum sum
	}
	return max
}
