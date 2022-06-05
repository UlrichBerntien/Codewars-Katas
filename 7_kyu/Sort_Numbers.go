package kata

import "sort"

func SortNumbers(numbers []int) []int {
	arr := make([]int, len(numbers))
	copy(arr, numbers)
	sort.Ints(arr)
	return arr
}
