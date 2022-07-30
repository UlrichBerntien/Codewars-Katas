package kata

// Returns length of the longest contiguous subarray which
// consists of Equal number of "0"s and "1"s.
func Binarray(a []int) int {
	maxLen := 0
  // Value of current disbalance: -X means X 0s too much, +X means X 1s too much.
	current := 0
  // Create a map n+disbalance to index.
  // Index in the array is n+disbalance because this value is >= 0.
	n := len(a)
	firstSeenID := make([]int, 1+n*2)
	for i, v := range a {
		if v == 0 {
			current--
		} else {
			current++
		}
		if firstSeenID[n+current] == 0 && current != 0 {
			firstSeenID[n+current] = i + 1
		}
    // length between current disbalance and last ssen disbalance
    // The number of 0s and 1s between two of this points must be the same.
		len := i + 1 - firstSeenID[n+current]
		if len > maxLen {
			maxLen = len
		}
	}
	return maxLen
}
