package kata

// Creates array of all subarrays arr of given length n.
func EachCons(arr []int, n int) [][]int {
	numberSubsets := len(arr) - n + 1
	if numberSubsets <= 0 {
		return [][]int{}
	}
	subsets := make([][]int, numberSubsets)
	for i := 0; i < numberSubsets; i++ {
		subsets[i] = arr[i : i+n]
	}
	return subsets
}
