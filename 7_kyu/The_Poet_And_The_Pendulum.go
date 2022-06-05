package kata

import "sort"

func Pendulum(values []int) []int {
	n := len(values)
	work := make([]int, n)
	// Create work copy. Source array will be unchanged.
	copy(work, values)
	// Simple sort
	sort.Ints(work)
	// Pendulum arrangement of sorted values
	pendulum := make([]int, n)
	for i := range pendulum {
		var dst int
		if i&1 == 0 {
			dst = (n - 1 - i) / 2
		} else {
			dst = (n + i) / 2
		}
		pendulum[dst] = work[i]
	}
	return pendulum
}
