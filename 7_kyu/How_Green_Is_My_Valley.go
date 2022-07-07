package kata

import "sort"

// Return the array zig-zag-sorted.
func MakeValley(arr []int) []int {
	n := len(arr)
	// sorted copy of the array
	sorted := make([]int, n)
	copy(sorted, arr)
	sort.Ints(sorted)
	// zig-zag structure
	zigzag := make([]int, n)
	mode := n & 1
	for i, v := range sorted {
		if i&1 == mode {
			zigzag[(n+i)/2] = v
		} else {
			zigzag[(n-i)/2] = v
		}
	}
	return zigzag
}
