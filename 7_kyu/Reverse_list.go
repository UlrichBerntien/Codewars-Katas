package kata

// Revers content of the array.
func ReverseList(lst []int) []int {
	n := len(lst)
	last := n - 1
	rev := make([]int, n)
	for i, v := range lst {
		rev[last-i] = v
	}
	return rev
}
