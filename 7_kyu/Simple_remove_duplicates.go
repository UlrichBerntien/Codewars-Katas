package kata

func Solve(arr []int) []int {
	filtered := make([]int, len(arr))
	seen := make(map[int]bool, len(arr))
	first := len(arr)
	for index := len(arr) - 1; index >= 0; index-- {
		x := arr[index]
		if !seen[x] {
			seen[x] = true
			first--
			filtered[first] = x
		}
	}
	return filtered[first:]
}
