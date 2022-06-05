package kata

import "unicode"

func Capitalize(st string, arr []int) string {
	// split the UTF-8 string into runes.
	r := []rune(st)
	rn := len(r)
	// convert runes by given indices
	for _, i := range arr {
		if 0 <= i && i < rn {
			r[i] = unicode.ToUpper(r[i])
		}
		// else: ignore index outside the arr
	}
	return string(r)
}
