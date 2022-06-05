package kata

func Solve(arr []int) int {
	counter := make(map[int]int, len(arr)/2)
	for _, v := range arr {
		if v > 0 {
			counter[v]++
		} else {
			counter[-v]--
		}
	}
	for k, v := range counter {
		if v != 0 {
			if v > 0 {
				return k
			} else {
				return -k
			}
		}
	}
	panic("value no found")
}
