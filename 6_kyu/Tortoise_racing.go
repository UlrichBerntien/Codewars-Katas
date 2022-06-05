package kata

func Race(v1, v2, g int) [3]int {
	if v1 >= v2 {
		// error exit
		return [3]int{-1, -1, -1}
	}
	total := (g * 3600) / (v2 - v1)
	sec := total % 60
	total /= 60
	min := total % 60
	hour := total / 60
	return [3]int{hour, min, sec}
}
