package kata

func IsCircleSorted(r []int) bool {
	n := len(r)
	index := 1
	// first part of the array is acending orderd
	for index < n && r[index-1] <= r[index] {
		index++
	}
	if index < n {
		// second part must be also acending orderd
		// and must be below the first part
		max := r[0]
		if max < r[index] {
			return false
		}
		index++
		for index < n {
			if max < r[index] || r[index] < r[index-1] {
				return false
			}
			index++
		}
	}
	return true
}
