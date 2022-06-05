package kata

// Store the items of the list in a map
func toMap(a []int) map[int]bool {
	m := make(map[int]bool, len(a))
	for _, x := range a {
		m[x] = true
	}
	return m
}

func ArrayDiff(a, b []int) []int {
	if len(a) == 0 || len(b) == 0 {
		// Quick exit on empty input or block list
		return a
	}
	exclude := toMap(b)
	result := make([]int, 0, len(a))
	for _, x := range a {
		if !exclude[x] {
			result = append(result, x)
		}
	}
	return result
}
