package kata

import (
	"errors"
	"sort"
)

func DiagonalsOfSquare(input []string) ([]string, error) {
	n := len(input)
	if n < 1 {
		return nil, errors.New("input array empty")
	}
	// sort list of strings but do not change the input array
	sortedIndex := make([]int, n)
	for i := 0; i < n; i++ {
		sortedIndex[i] = i
	}
	sort.Slice(sortedIndex, func(i, j int) bool {
		return input[sortedIndex[i]] < input[sortedIndex[j]]
	})
	// prepare the buffer for results
	resultRunes := make([][]rune, n)
	for i := 0; i < n; i++ {
		resultRunes[i] = make([]rune, n)
	}
	// copy the character into the result buffer
	for strIndex := 0; strIndex < n; strIndex++ {
		runes := []rune(input[sortedIndex[strIndex]])
		if len(runes) != n {
			return nil, errors.New("string with invalid len in input")
		}
		for resultIndex, r := range resultRunes {
			runeIndex := (n + strIndex - resultIndex) % n
			r[runeIndex] = runes[runeIndex]
		}
	}
	// join the result string
	resultStrings := make([]string, n)
	for i := 0; i < n; i++ {
		resultStrings[sortedIndex[i]] = string(resultRunes[i])
	}
	return resultStrings, nil
}
