package kata

func Range(start, end, step int) []int {
	count := end - start
	if step != 0 {
		count /= step
	}
	if count < 0 {
		count = 0
	}
	arr := make([]int, count)
	current := start
	for i := 0; i < count; i++ {
		arr[i] = current
		current += step
	}
	return arr
}
