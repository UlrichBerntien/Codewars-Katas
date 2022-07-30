package kata

import "math"

// Interpret Function 'f' for 'n' points in 'l..u'.
// Return function values truncated to 2 decimals.
func Interp(f func(float64) float64, l float64, u float64, n int) []float64 {
	values := make([]float64, n)
	d := (u - l) / float64(n)
	for i := 0; i < n; i++ {
		y := f(l + float64(i)*d)
		values[i] = math.Floor(y*100) / 100
	}
	return values
}
