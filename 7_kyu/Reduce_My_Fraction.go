package kata

// Calculates the greates common devisor.
func gcd(a int, b int) int {
	// Euclidean algorithm
	for b != 0 {
		a, b = b, a%b
	}
	return a
}

// Absolute value
func abs(x int) int {
	if x > 0 {
		return x
	} else {
		return -x
	}
}

// Reduce fraction
func ReduceFraction(fraction [2]int) [2]int {
	g := gcd(abs(fraction[0]), abs(fraction[1]))
	return [2]int{fraction[0] / g,fraction[1] / g}
}
