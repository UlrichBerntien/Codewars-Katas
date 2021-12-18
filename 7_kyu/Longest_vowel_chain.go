package kata

func isVowel(r rune) bool {
	switch r {
	case 'a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U':
		return true
	default:
		return false
	}
}

func Solve(s string) int {
	count := 0
	maxCount := 0
	for _, r := range s {
		if isVowel(r) {
			count++
			if count > maxCount {
				maxCount = count
			}
		} else {
			count = 0
		}
	}
	return maxCount
}
