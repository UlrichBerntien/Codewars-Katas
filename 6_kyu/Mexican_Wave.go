package kata

import "strings"

func wave(words string) []string {
	lower := []rune(strings.ToLower(words))
	upper := []rune(strings.ToUpper(words))
	result := make([]string, 0, len(upper))
	for i := range lower {
		if lower[i] != upper[i] {
			save_lower := lower[i]
			lower[i] = upper[i]
			result = append(result, string(lower))
			lower[i] = save_lower
		}
	}
	return result
}
