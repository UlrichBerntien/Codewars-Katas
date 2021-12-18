package kata

import "strings"

func High(s string) string {
	var topWord string
	var topScore int64
	for _, word := range strings.Fields(s) {
		var currentWordScore int64
		for _, r := range word {
			currentWordScore += int64(r - 'a' + 1)
		}
		if currentWordScore > topScore {
			topWord = word
			topScore = currentWordScore
		}
	}
	return topWord
}
