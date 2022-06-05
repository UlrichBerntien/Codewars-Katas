package kata

import "unicode"

func ToAlternatingCase(str string) string {
	runes := []rune(str)
	for i, r := range runes {
		if unicode.IsUpper(r) {
			runes[i] = unicode.ToLower(r)
		} else {
			runes[i] = unicode.ToUpper(r)
		}
	}
	return string(runes)
}
