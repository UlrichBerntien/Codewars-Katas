package kata

import "fmt"

// Trim integer x to intervall min..max
func trim(x, min, max int) int {
	if x < min {
		return min
	}
	if x > max {
		return max
	}
	return x
}

func RGB(r, g, b int) string {
	r = trim(r, 0, 0xff)
	g = trim(g, 0, 0xff)
	b = trim(b, 0, 0xff)
	return fmt.Sprintf("%02X%02X%02X", r, g, b)
}
