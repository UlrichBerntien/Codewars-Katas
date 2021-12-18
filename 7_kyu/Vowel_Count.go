package kata

import "strings"

func GetCount(str string) (count int) {
	for _, r := range strings.ToLower(str) {
		if 'a' == r || 'e' == r || 'i' == r || 'o' == r || 'u' == r {
			count++
		}
	}
	return count
}
