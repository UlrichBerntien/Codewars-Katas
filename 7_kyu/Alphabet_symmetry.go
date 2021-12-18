package kata

import "unicode"

var alphabet = []rune("abcdefghijklmnopqrstuvwxyz")

func countMatches(str string, ref []rune) int {
	accu := 0
	for i, r := range str {
		if unicode.ToLower(r) == ref[i] {
			accu++
		}
	}
	return accu
}

func solve(slice []string) []int {
	counts := make([]int, len(slice))
	for i, s := range slice {
		counts[i] = countMatches(s, alphabet)
	}
	return counts
}