package kata

import (
	"strings"
	"unicode"
)

func Vaporcode(s string) string {
	var accu strings.Builder
	// Allocate maximal used buffer size
	accu.Grow(len(s) * 3)
	for _, c := range s {
		// Store only the non-space runes in the output string.
		if c != ' ' {
			accu.WriteRune(unicode.ToUpper(c))
			// Add 2 spaces between the runes
			accu.WriteByte(' ')
			accu.WriteByte(' ')
		}
	}
	// Cut the last 2 bytes, the last 2 space chars.
	result := accu.String()
	if len(result) > 1 {
		result = result[:len(result)-2]
	}
	return result
}
