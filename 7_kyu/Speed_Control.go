package kata

func Gps(s int, x []float64) int {
	var max_delta float64
	for index := 1; index < len(x); index++ {
		delta := x[index] - x[index-1]
		if max_delta < delta {
			max_delta = delta
		}
	}
	return int(3600*max_delta) / s
}
