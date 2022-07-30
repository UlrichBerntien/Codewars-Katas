package kata

func Seven(n int64) []int {
	steps := 0
	for n > 99 {
		x := n / 10
		y := n % 10
		n = x - 2*y
		steps++
	}
	return []int{int(n), steps}
}
