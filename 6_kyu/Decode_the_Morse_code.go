package kata

import (
	"regexp"
	"strings"
)

// Matches morse codes and separators in the string.
var code_regexp = regexp.MustCompile(`\s+|[.-]+`)

// Interprets mores codes for one character and spaces.
func interpret(code string) string {
	switch {
	case code == " ":
		return ""
	case code[0] == ' ':
    // if first rune is a space all runes must be spaces because the pattern.
		return " "
	default:
		return MORSE_CODE[code]
	}
}

func DecodeMorse(morseCode string) string {
	return code_regexp.ReplaceAllStringFunc(strings.TrimSpace(morseCode), interpret)
}
