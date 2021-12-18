package kata

import "regexp"

// Pattern to match text blocks (all not space).
var word = regexp.MustCompile(`\S+`)

// Reverse a string. (Multibyte character ready.)
func reverse(str string) string {
	src := []rune(str)
	dst := make([]rune, len(src))
	last := len(src) - 1
	for i, c := range src {
		dst[last-i] = c
	}
	return string(dst)
}

func ReverseWords(str string) string {
	return word.ReplaceAllStringFunc(str, reverse)
}
