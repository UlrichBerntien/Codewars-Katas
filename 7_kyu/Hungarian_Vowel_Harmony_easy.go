package kata

import "errors"

const idConsonant int8 = 0
const idFrontVowel int8 = 1
const idBackVowel int8 = 2

var runeId = map[rune]int8{
	'e': idFrontVowel,
	'é': idFrontVowel,
	'i': idFrontVowel,
	'í': idFrontVowel,
	'ö': idFrontVowel,
	'ő': idFrontVowel,
	'ü': idFrontVowel,
	'ű': idFrontVowel,
	'a': idBackVowel,
	'á': idBackVowel,
	'o': idBackVowel,
	'ó': idBackVowel,
	'u': idBackVowel,
	'ú': idBackVowel}

// Dative returns the dative case for a given Hungarian word.
func Dative(word string) (string, error) {
	runes := []rune(word)
	if len(runes) < 1 {
		return word, errors.New("empty word")
	}
	if runeId[runes[len(runes)-1]] != idConsonant {
		return word, errors.New("no consonant at word end")
	}
	lastVowel := idConsonant
	for index := len(runes) - 1; index >= 0 && lastVowel == idConsonant; index-- {
		lastVowel = runeId[runes[index]]
	}
	switch lastVowel {
	case idFrontVowel:
		return word + "nek", nil
	case idBackVowel:
		return word + "nak", nil
	default:
		return word, errors.New("no vowel in word")
	}
}
