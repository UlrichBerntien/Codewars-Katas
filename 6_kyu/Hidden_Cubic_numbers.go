package kata

import (
	"bytes"
	"fmt"
	"regexp"
)

// Pattern that machtes all 3 decimal digit numbers.
var numberPattern = regexp.MustCompile(`\d{1,3}`)

// Checks if s is a "cubic" decimal number.
// Returns ok if sum(digit³) == value.
// Returns the value of the number
func checkCubic(s string) (bool, int) {
	// sum of the digits³
	sum := 0
	// value of the decimal number
	value := 0
	for _, r := range s {
		digit := int(r - '0')
		sum += digit * digit * digit
		value = value*10 + digit
	}
	return sum == value, value
}

// Parses for hidden "Cubic" numbers and creates a answer string.
func IsSumOfCubes(s string) string {
	// sum of all found cubic numbers
	resultSum := 0
	// buffer to build the result string
	var resultText bytes.Buffer
	for _, number := range numberPattern.FindAllString(s, -1) {
		ok, value := checkCubic(number)
		if ok {
			// add the cubic number to the sum and the result text
			resultSum += value
			// add the number without leading 0 digits
			fmt.Fprintf(&resultText, "%d ", value)
		}
	}
	if resultText.Len() > 0 {
		// some cubic numbers where found: add the sum to the result text
		fmt.Fprintf(&resultText, "%d Lucky", resultSum)
		return resultText.String()
	} else {
		// no cubic number found: return the error text
		return "Unlucky"
	}
}
