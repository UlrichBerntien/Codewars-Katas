package kata

import "strings"

// Return The string s expanded with spaces between each rune in s.
func Spacify(s string) string {
	var accu strings.Builder
	// Allocate maximal used buffer size
	accu.Grow(len(s) * 2)
	for _, c := range s {
		// Add one space after each rune in the string s
		accu.WriteRune(c)
		accu.WriteByte(' ')
	}
	// Cut the last appended byte, the space char.
	result := accu.String()
	if len(result) > 0 {
		result = result[:len(result)-1]
	}
	return result
}
