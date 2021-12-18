package kata

import (
	"strings"
	"unicode"
)

func toWeirdCase(str string) string {
	upper := []rune(strings.ToUpper(str))
	lower := []rune(strings.ToLower(str))
	result := make([]rune, len(upper))
	wordIndex := 0
	for i := range result {
		if wordIndex%2 == 0 {
			result[i] = upper[i]
		} else {
			result[i] = lower[i]
		}
		if unicode.IsSpace(upper[i]) {
			wordIndex = 0
		} else {
			wordIndex++
		}
	}
	return string(result)
}
