package kata

// Array of all vowels, ordered.
// Used as constant. But it isn't const for Go.
var vowels = []rune{'a', 'e', 'i', 'o', 'u'}

// Count the number of vowels in order.
func GetTheVowels(word string) int {
	// counter of vowels found in the correct order.
	counter := 0
	// index of the next vowel in the vowels array.
	// Only this char is counted, all other are ignored.
	vowel_index := 0
	// Iterate over runes
	for _, r := range word {
		if r == vowels[vowel_index] {
			counter++
			vowel_index++
			if vowel_index == len(vowels) {
				vowel_index = 0
			}
		}
	}
	return counter
}
