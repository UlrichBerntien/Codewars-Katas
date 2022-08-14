package kata

// Find the greatest common divisor of two positive integers.
// Implementation of the Euclidean algorithm.
func Gcd(x, y uint32) uint32 {
	for y != 0 {
		x, y = y, x%y
	}
	return x
}
