package kata

import (
	"regexp"
	"strconv"
)

// Pattern to accept decimal integer numbers.
var decimalNumber = regexp.MustCompile(`\d+`)

func SumOfIntegersInString(strng string) int {
	var accu int = 0
	// Find all decimal numbers in the strng.
	for _, number := range decimalNumber.FindAllString(strng, -1) {
		if value, err := strconv.Atoi(number); err == nil {
			accu += value
		}
		// else: ignore invalid numbers (too long)
	}
	return accu
}
