package kata

import "strings"

// Gets the position of the word.
// The position (0..9) is given by a decimal digit in the string.
func position(word string) int {
	// Parse string by runes, multi-byte safe.
	for _, r := range word {
		if '0' <= r && r <= '9' {
			// the first digit in the word is the position code.
			return int(r) - int('0')
		}
	}
	// No digit in the word.
	// Return 0 as error fall back value.
	return 0
}

// Sorts words in the senctence by digit in the words.
func Order(sentence string) string {
	ordered := make([]string, 10)
	// Split the the string and sort the words by position code.
	for _, word := range strings.Fields(sentence) {
		ordered[position(word)] = word
	}
	// Rebuild the sentence. Words seperated by one space.
	return strings.TrimSpace(strings.Join(ordered, " "))
}
