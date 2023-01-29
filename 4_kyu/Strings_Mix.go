package kata

import (
	"sort"
	"strings"
)

// Infos about one letter.
type letterInfo struct {
	letter   rune
	count    [3]int // index 0 is unused
	maxCount int
	maxIndex int // index 0 if equal count
}

// Adds the letters (only a-z) of the string to the counter.
// Index in the info is letter-'a'.
func updateCountLetters(s string, countIndex int, info []letterInfo) {
	for _, c := range s {
		if 'a' <= c && c <= 'z' {
			info[c-'a'].count[countIndex]++
		}
	}
	return
}

// Counts the letters (only a-z) in the two strings.
// Index in the returned array is letter-'a'.
func countLetters(s1, s2 string) []letterInfo {
	azCount := int('z'-'a') + 1
	info := make([]letterInfo, azCount)
	for i := 0; i < azCount; i++ {
		info[i].letter = rune('a' + i)
	}
	updateCountLetters(s1, 1, info)
	updateCountLetters(s2, 2, info)
	return info
}

// Creates an array with references for simpler change and faster sort.
func createRefLetters(input []letterInfo) []*letterInfo {
	output := make([]*letterInfo, len(input))
	for index := 0; index < len(input); index++ {
		output[index] = &input[index]
	}
	return output
}

// Calculates the max counts and the max index.
func calculateMaxs(letters []*letterInfo) {
	for _, l := range letters {
		switch {
		case l.count[1] > l.count[2]:
			l.maxCount = l.count[1]
			l.maxIndex = 1
		case l.count[2] > l.count[1]:
			l.maxCount = l.count[2]
			l.maxIndex = 2
		default: // l.count[1] == l.count[2]
			l.maxCount = l.count[1]
			l.maxIndex = 0
		}
	}
}

// Formats the letter infos according the kata specification.
// Includes only letters down to limit maximal coint.
func formatLetters(letters []*letterInfo, limit int) string {
  index2name := [3]string{"=:", "1:", "2:"}
	var result strings.Builder
	for i, l := range letters {
		if l.maxCount < limit {
			break
		}
		if i > 0 {
			result.WriteRune('/')
		}
    result.WriteString( index2name[l.maxIndex] )
		for i := 0; i < l.maxCount; i++ {
			result.WriteRune(l.letter)
		}
	}
	return result.String()
}

func Mix(s1, s2 string) string {
	letters := countLetters(s1, s2)
	refLetters := createRefLetters(letters)
	calculateMaxs(refLetters)
	// Sort descending by max count, by max index and ascending by letter
	greaterRefLetter := func(i, j int) bool {
		indexOrder := [3]int{0, 2, 1}
		il := refLetters[i]
		jl := refLetters[j]
		switch {
		case il.maxCount != jl.maxCount:
			return il.maxCount > jl.maxCount
		case il.maxIndex != jl.maxIndex:
			return indexOrder[il.maxIndex] > indexOrder[jl.maxIndex]
		default:
			return il.letter < jl.letter
		}
	}
	sort.Slice(refLetters, greaterRefLetter)
	return formatLetters(refLetters, 2)
}
