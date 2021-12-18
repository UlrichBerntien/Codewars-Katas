package kata

import "sort"

func Solve(arr []int) int {
	days := 0
	sort.Ints(arr)
	for arr[1] > 0 {
		n := arr[1]
		if arr[0] > 0 {
			n -= arr[0] - 1
		}
		days += n
		arr[1] -= n
		arr[2] -= n
		sort.Ints(arr)
	}
	return days
}
