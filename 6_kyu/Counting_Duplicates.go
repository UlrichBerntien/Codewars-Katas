package kata

import "strings"

func duplicate_count(s1 string) int {
	count := make(map[rune]int, 37)
	for _, r := range strings.ToLower(s1) {
		count[r]++
	}
	var countDoubles int = 0
	for _, c := range count {
		if c > 1 {
			countDoubles++
		}
	}
	return countDoubles
}
