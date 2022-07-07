package kata

// Returns a list of the powers of 2 with the exponent ranging from 0 to n
func PowersOfTwo(n int) []uint64 {
	result := make([]uint64, n+1)
	value := uint64(1)
	for i := 0; i <= n; i++ {
		result[i] = value
		value <<= 1
	}
	return result
}
