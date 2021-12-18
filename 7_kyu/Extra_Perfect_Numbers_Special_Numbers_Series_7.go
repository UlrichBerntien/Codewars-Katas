package kata

func ExtraPerfect(n int) []int {
	count := (n + 1) / 2
	result := make([]int, count)
	for i := 0; i < count; i++ {
		result[i] = 2*i + 1
	}
	return result
}
