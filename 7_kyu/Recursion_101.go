package kata

func Solve(a, b int) []int {
	for a > 0 && b > 0 && (a >= 2*b || b >= 2*a) {
		if b > 0 {
			a %= 2 * b
		}
		if a > 0 {
			b %= 2 * a
		}
	}
	return []int{a, b}
}
