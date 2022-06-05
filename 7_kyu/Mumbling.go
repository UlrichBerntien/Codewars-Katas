package kata

import (
	"strings"
	"unicode"
)

func Accum(s string) string {
	n := len(s)
	var accu strings.Builder
	accu.Grow(n * (n - 1))
	for i, r := range s {
		u := unicode.ToUpper(r)
		l := unicode.ToLower(r)
		accu.WriteRune(u)
		for j := 0; j < i; j++ {
			accu.WriteRune(l)
		}
		if i+1 < n {
			accu.WriteRune('-')
		}
	}
	return accu.String()
}
