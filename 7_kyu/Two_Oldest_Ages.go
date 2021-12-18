package kata

import "sort"

func TwoOldestAges(ages []int) [2]int {
	if len(ages) < 2 {
		panic("array length < 2")
	}
	// don't change the argument array, make a copy
	ages_sorted := make([]int, len(ages))
	copy(ages_sorted, ages)
	// simply sort all
	// possible optimization: heap sort only of the top 2.
	sort.Ints(ages_sorted)
	return [2]int{ages_sorted[len(ages)-2], ages_sorted[len(ages)-1]}
}
