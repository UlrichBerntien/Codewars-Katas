package kata

import "unicode"

// Only ASCII letters are used.
// All other characters (e.g. ASCII extensions like ß) are ignored.
const (
	firstLetter   = 'a'
	lastLetter    = 'z'
	numberLetters = lastLetter - firstLetter + 1
)

// Array of letter count for letters firstLetter..lastLetter.
type letterCount []uint

// Counts the letters in a string.
// Counts ony ASCII letters, ignores all other letters.
func countLetters(word string) letterCount {
	accu := make(letterCount, numberLetters)
	for _, r := range word {
		index := unicode.ToLower(r) - firstLetter
		if 0 <= index && index < numberLetters {
			accu[index]++
		}
	}
	return accu
}

// Compares the number of each letter.
// Returns true if and only if the count of each letter is equal.
func equalLetters(a letterCount, b letterCount) bool {
	for i := 0; i < numberLetters; i++ {
		if a[i] != b[i] {
			return false
		}
	}
	return true
}

// Filters the anagrams of the word.
func Anagrams(word string, words []string) []string {
	reference := countLetters(word)
	accu := make([]string, 0, len(words))
	for _, w := range words {
		if equalLetters(reference, countLetters(w)) {
			accu = append(accu, w)
		}
	}
	return accu
}
