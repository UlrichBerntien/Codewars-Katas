package kata

import (
	"strings"
	"unicode"
)

func Capitalize(st string) []string {
	accu := [2]strings.Builder{}
	for i := range accu {
		accu[i].Grow(len(st))
	}
	a, b := 0, 1
	for _, r := range st {
		accu[a].WriteRune(unicode.ToUpper(r))
		accu[b].WriteRune(unicode.ToLower(r))
		a, b = b, a
	}
	return []string{accu[0].String(), accu[1].String()}
}
