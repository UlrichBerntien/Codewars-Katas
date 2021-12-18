package kata

import "math"

// Truncate rsult to 6 decimals
const decimals = 1000000.

func Going(n int) float64 {
	// x = n!/1!, n!/2!, ..., n!/n!
	x := make([]float64, n)
	var f float64 = 1
	for i := n; i > 0; i-- {
		x[i-1] = f
		f *= float64(i)
	}
	// sum up the small numbers first to reduce floating point errors
	var sum float64 = 0
	for _, v := range x {
		sum += 1 / v
	}
	return math.Trunc(sum*decimals) / decimals
}
