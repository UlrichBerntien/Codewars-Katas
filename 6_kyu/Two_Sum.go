package kata

func TwoSum(numbers []int, target int) [2]int {
	// Prepare the result array with -1 index.
  // If no pair was found the -1 indices are returned.
  result := [...]int{-1, -1}
	// Collect all values of numbers in a map for fast access by value.
	// The key is the value of the number, the value is the index in array numbers.
	value2index := make(map[int]int, len(numbers))
	for index1, value := range numbers {
		if index2, found := value2index[target-value]; found {
			// Found a pair with sum = target.
			if index1 > index2 {
				result[0] = index2
				result[1] = index1
			} else {
				result[0] = index1
				result[1] = index2
			}
      // Return the index sorted.
			return result
		}
		// Insert the value after the search, because
		// two times the same index is not allowed.
		value2index[value] = index1
	}
	// No pair found
	return result
}
