package kata

import "regexp"

// Pattern matching word with at least 5 letters
var word5 = regexp.MustCompile(`\p{L}{5,}`)

// Return the string reversed.
func reverse(s string) string {
	a := []rune(s)
	last := len(a) - 1
	for i := 0; i <= last/2; i += 1 {
		a[i], a[last-i] = a[last-i], a[i]
	}
	return string(a)
}

// Returns string with all word with 5 or more letters reversed.
func SpinWords(str string) string {
	return word5.ReplaceAllStringFunc(str, reverse)
}
