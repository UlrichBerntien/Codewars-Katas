package kata

import "unicode"

func DuplicateEncode(word string) string {
	runes := []rune(word)
	counter := make(map[rune]int)
	for i, r := range runes {
		r = unicode.ToLower(r)
		runes[i] = r
		counter[r]++
	}
	for i, r := range runes {
		if counter[r] == 1 {
			runes[i] = '('
		} else {
			runes[i] = ')'
		}
	}
	return string(runes)
}
