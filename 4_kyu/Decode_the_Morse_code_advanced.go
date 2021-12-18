package kata

import (
	"regexp"
	"strings"
)

// Matches sequences of 1 or 0 bits.
var bitsRegexp = regexp.MustCompile(`1+|0+`)

// Bits per time unit for intepreting bits
var timeUnit = 1

// Interpret sequences of on bit (1 or 0).
// The timeUnit must be set before.
func interpret_bits(code string) string {
	len_code := len(code)
	c := code[0]
	switch {
	case c == '1' && len_code < 3*timeUnit:
		return "."
	case c == '1':
		return "-"
	case c == '0' && len_code < 3*timeUnit:
		return ""
	case c == '0' && len_code < 7*timeUnit:
		return " "
	case c == '0':
		return "  "
	default:
		return ""
	}
}

// time unit is the shortest signal
func find_timeUnit(bits string) string {
	l := len(bits)
	if l < timeUnit {
		timeUnit = l
	}
	return ""
}

func DecodeBits(bits string) string {
	bits = strings.Trim(bits, "0")
	timeUnit = len(bits)
	bitsRegexp.ReplaceAllStringFunc(bits, find_timeUnit)
	return bitsRegexp.ReplaceAllStringFunc(bits, interpret_bits)
}

// Matches morse codes and separators in the string.
var code_regexp = regexp.MustCompile(`\s+|[.-]+`)

// Interprets mores codes for one character and spaces.
func interpret_morse(code string) string {
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
	return code_regexp.ReplaceAllStringFunc(strings.TrimSpace(morseCode), interpret_morse)
}
