package kata

import "strings"

// Reverse
func reverse(a []string) {
	len := len(a)
	for left, right := 0, len-1; left < right; {
		a[left], a[right] = a[right], a[left]
		left++
		right--
	}
}

func ReverseWords(str string) string {
	words := strings.Fields(str)
	reverse(words)
	return strings.Join(words, " ")
}
