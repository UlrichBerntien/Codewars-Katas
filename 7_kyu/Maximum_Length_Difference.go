package kata

// Minmum und maximum of the lengths.
func minMaxLength(a []string) (min, max int) {
	lenA := len(a)
	if lenA == 0 {
		// Error case empty input
		min, max = -1, -1
	}
	min = len(a[0])
	max = min
	for i := 1; i < lenA; i++ {
		l := len(a[i])
		if l > max {
			max = l
		} else if l < min {
			min = l
		}
	}
	return
}

// Absoluw value
func abs(x int) int {
	if x < 0 {
		return -x
	}
	return x
}

// Maximum of two intergers.
func max(a, b int) int {
	if a > b {
		return a
	}
	return b
}

// Maximal difference between the length ofthe string in array a1 and a2.
// Return -1 if one array is empty.
func MxDifLg(a1 []string, a2 []string) int {
	if len(a1) == 0 || len(a2) == 0 {
		// Error case empty input: return -1
		return -1
	}
	min1, max1 := minMaxLength(a1)
	min2, max2 := minMaxLength(a2)
	return max(abs(max2-min1), abs(max1-min2))
}
