package kata

import (
	"bytes"
	"strconv"
)

func Numericals(input string) string {
	n := len(input)
	counter := make(map[rune]int, n)
	var accu bytes.Buffer
	accu.Grow(2 * n)
	for _, r := range input {
		counter[r]++
		accu.WriteString(strconv.Itoa(counter[r]))
	}
	return accu.String()
}
