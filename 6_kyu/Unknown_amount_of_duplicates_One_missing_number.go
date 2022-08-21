package kata

import "sort"

// Finds the missing number and the doubled numbes.
func FindDupsMiss(arr []int) (int, []int) {
	sort.Ints(arr)
	doubles := make([]int, 0)
	var missing int
	last := arr[0]
	for i := 1; i < len(arr); i++ {
		next := arr[i]
		switch {
		case last == next:
			if len(doubles) == 0 || doubles[len(doubles)-1] != last {
				doubles = append(doubles, last)
			}
		case last+1 != next:
			missing = last + 1
		}
		last = next
	}
	return missing, doubles
}
