package kata

import (
	"strconv"
	"strings"
)

func Solution(list []int) string {
	listLen := len(list)
	var dst strings.Builder
	for listIndex := 0; listIndex < listLen; {
		if listIndex > 0 {
			// Separator between numbers and sequences
			dst.WriteRune(',')
		}
		first := list[listIndex]
		dst.WriteString(strconv.Itoa(first))
		listIndex++
		// Check if a sequence is in the list at the current position
		secondIndex := listIndex
		second := first + 1
		for secondIndex < listLen && list[secondIndex] == second {
			secondIndex++
			second++
		}
		// the for loop ends with second and secondIndex behind the sequence
		second--
		// Do not combine 1,2 to a sequence 1-2. So compare "second-1".
		if second-1 > first {
			// Combine numbers to a sequence
			dst.WriteRune('-')
			dst.WriteString(strconv.Itoa(second))
			listIndex = secondIndex
		}
	}
	return dst.String()
}
