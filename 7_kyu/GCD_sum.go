package kata

func Solve(s int, g int) []int {
	b := s - g
	if g < 0 || b < 0 || b%g > 0 {
		return []int{-1, -1}
	} else {
		return []int{g, b}
	}
}
