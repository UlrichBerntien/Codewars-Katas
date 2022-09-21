package kata

// Counts maximal possible divisions n/=d until 0 reached.
func Divisions(n, divisor int) int {
	if divisor < 2 {
		panic("invalid argument 'divisor'")
	}
	count := 0
	for n >= divisor {
		n /= divisor
		count++
	}
	return count
}
