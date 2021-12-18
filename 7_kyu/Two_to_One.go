package kata

import "sort"

func TwoToOne(s1 string, s2 string) string {
	seen := make(map[rune]bool)
	combined := make([]rune, 0, len(s1)+len(s2))
	for _, str := range []string{s1, s2} {
		for _, c := range str {
			if !seen[c] {
				seen[c] = true
				combined = append(combined, c)
			}
		}
	}
	sort.Slice(combined,
		func(i, j int) bool { return combined[i] < combined[j] })
	return string(combined)
}