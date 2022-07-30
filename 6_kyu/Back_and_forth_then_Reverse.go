package kata

// Rearrange the items of the array s.
func Arrange(s []int) []int {
	result := make([]int, 0, len(s))
	// Index of the next item to copy from array s.
	first, last := 0, len(s)-1
	// Copy first item form s into the result array
	copyFirst := func() {
		result = append(result, s[first])
		first++
	}
	// Copy last iem frim s int othe result array
	copyLast := func() {
		result = append(result, s[last])
		last--
	}
	for first <= last {
		copyFirst()
		if first <= last {
			copyLast()
		}
		if first <= last {
			copyLast()
		}
		if first <= last {
			copyFirst()
		}
	}
	return result
}
