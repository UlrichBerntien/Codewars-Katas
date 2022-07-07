package kata

import "unicode"

// Map rune -> string with this rune in upper case for a..z,A..Z.
// The DictScore key is a string.
// This generates fast the needed strings.
var scoreIndex = generateScoreIndex()

// Generates the rune -> string mapping needed to access the DictScore.
func generateScoreIndex() map[rune]string {
	r2string := make(map[rune]string, 2*('Z'-'A'+1))
	for r := 'A'; r <= 'Z'; r++ {
		r2string[r] = string(r)
		r2string[unicode.ToLower(r)] = r2string[r]
	}
	return r2string
}

// Computes the scrabble score for that word.
// Ignores non-letters in the word.
func ScrabbleScore(st string) int {
	accu := 0
	for _, r := range st {
	  accu += DictScores[scoreIndex[r]]
	}
	return accu
}
