package kata

import (
	"strings"
	"unicode"
)

// Converts dash/underscore delimited words into camel casing.
func ToCamelCase(s string) string {
	// Fast string concat in strings builder object.
	var accu strings.Builder
	// Allocate the maximal possible size.
	// Typical a few bytes longer than needed.
	accu.Grow(len(s))
	// This flags indicates that the next char must be converted to upper case.
	nextToUpper := false
	for _, r := range s {
		switch {
		case r == '_' || r == '-':
			nextToUpper = true
		case nextToUpper:
			accu.WriteRune(unicode.ToUpper(r))
			nextToUpper = false
		default:
			accu.WriteRune(r)
		}
	}
	return accu.String()
}
