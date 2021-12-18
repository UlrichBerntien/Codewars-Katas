package kata

func Solve(s string, a, b int) string {
	r := []rune(s)
	// cut index a and b to the valid range
	if a < 0 {
		a = 0
	}
	if b > len(r) - 1 {
		b = len(r) - 1
	}
	half := (b - a + 1) / 2
	for index := 0; index < half; index++ {
		r[a+index], r[b-index] = r[b-index], r[a+index]
	}
	return string(r)
}
