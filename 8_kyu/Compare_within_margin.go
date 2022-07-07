package kata

// Compare with margins.
// a == b ± margin:  0
// a  < b - margin: -1
// a  > b + margin: +1
func CloseCompare(a, b, margin float64) int {
	delta := a - b
	switch {
	case delta < -margin:
		return -1
	case delta > margin:
		return 1
	default:
		return 0
	}
}
