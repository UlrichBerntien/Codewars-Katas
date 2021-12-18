package kata

import (
	"strconv"
	"strings"
)

func FreqSeq(str string, sep string) string {
	input := []rune(str)
	// Count the occurences
	counter := make(map[rune]int)
	for _, r := range input {
		counter[r]++
	}
	// Convert counter values only one time
	counterString := make(map[rune]string, len(counter))
	for r, n := range counter {
		counterString[r] = strconv.Itoa(n)
	}
	// Build the output string
	var output strings.Builder
	output.Grow(2 * len(input))
	for i := 0; i < len(input)-1; i++ {
		output.WriteString(counterString[input[i]])
		output.WriteString(sep)
	}
	output.WriteString(counterString[input[len(input)-1]])
	return output.String()
}