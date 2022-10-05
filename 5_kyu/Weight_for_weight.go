package kata

import (
	"sort"
	"strings"
)

// Array of weightedString items with interface to sort them
type weightedStrings struct {
	n      int      // length of both arrays
	word   []string // the words
	weight []uint32 // the weight of each word
}

// Sets words and weight of the text
// Weight is the sum of the values of all decimal digits in the text.
func createWeightedStrings(input []string) weightedStrings {
	a := weightedStrings{
		n:      len(input),
		word:   input,
		weight: make([]uint32, len(input)),
	}
	for i := 0; i < a.n; i++ {
		sum := uint32(0)
		for _, r := range a.word[i] {
			if '1' <= r && r <= '9' {
				sum += uint32(r - '0')
			}
		}
		a.weight[i] = sum
	}
	return a
}

// Length of the array.
func (a weightedStrings) Len() int {
	return a.n
}

// Swaps two items in the array.
func (a weightedStrings) Swap(i, j int) {
	a.word[i], a.word[j] = a.word[j], a.word[i]
	a.weight[i], a.weight[j] = a.weight[j], a.weight[i]
}

// Comparison of two items in the array.
// Comparison by the weight values.
func (a weightedStrings) Less(i, j int) bool {
	if a.weight[i] != a.weight[j] {
		return a.weight[i] < a.weight[j]
	} else {
		return a.word[i] < a.word[j]
	}
}

// Order fields in the strng by decimal digit sum.
// Input is a string of word separated by spaces.
func OrderWeight(strng string) string {
	weighted := createWeightedStrings(strings.Fields(strng))
	sort.Sort(weighted)
	return strings.Join(weighted.word, " ")
}
