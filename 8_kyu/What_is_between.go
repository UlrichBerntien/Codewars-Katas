package kata

func Between(a, b int) []int {
	size := b - a + 1
	arr := make([]int, size)
	for i := range arr {
		arr[i] = a + i
	}
	return arr
}
