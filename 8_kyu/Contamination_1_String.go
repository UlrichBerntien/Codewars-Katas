package kata

import (
	"strings"
	"unicode/utf8"
)

// Replace all characters in the text by char.
// String char must contain one character.
// Returns empty string if text is empty or char is not one character.
func Contamination(text, char string) string {
	// use utf8 fpr a multi-byte character safe implementation.
	textLen := utf8.RuneCountInString(text)
	charLen := utf8.RuneCountInString(char)
	if textLen <= 0 || charLen != 1 {
		return ""
	}
	return strings.Repeat(char, textLen)
}
