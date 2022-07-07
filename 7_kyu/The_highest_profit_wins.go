package kata

func MinMax(arr []int) [2]int {
	if len(arr) == 0 {
		panic("empty array")
	}
	min := arr[0]
	max := arr[0]
	for _, v := range arr {
		if v < min {
			min = v
		} else if v > max {
			max = v
		}
	}
	return [2]int{min, max}
}
