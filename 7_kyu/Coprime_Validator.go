package kata

// Calculates the Greatest Common Devisor (GCD)
// https://en.wikipedia.org/wiki/Euclidean_algorithm
func gcd(a, b int) int {
	for b != 0 {
		a, b = b, a%b
	}
	return a
}

// Checks Coprime of two integers.
// Return True if and only if n and m are coprime.
func AreCoprime(n, m int) bool {
	return gcd(n, m) == 1
}
