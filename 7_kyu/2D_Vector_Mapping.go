package kata

func MapVector(vector, circle1, circle2 []float64) []float64 {
	delta := []float64{vector[0] - circle1[0], vector[1] - circle1[1]}
	delta[0] *= circle2[2] / circle1[2]
	delta[1] *= circle2[2] / circle1[2]
	return []float64{delta[0] + circle2[0], delta[1] + circle2[1]}
}
