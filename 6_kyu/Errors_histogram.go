package kata

import (
	"bytes"
	"fmt"
)

// Error codes
// The order in this array is the order in the output.
var errorCode = []rune{'u', 'w', 'x', 'z'}

func Hist(s string) string {
	// Error code counters
	counter := make([]int, len(errorCode))
	// Parse input string
	for _, code := range s {
		for index, error := range errorCode {
			if code == error {
				counter[index]++
			}
		}
	}
	// Generate output string direct in Buffer
	var dest bytes.Buffer
	for index, error := range errorCode {
		errorCount := counter[index]
		if errorCount > 0 {
			if dest.Len() > 0 {
				dest.WriteRune('\r')
			}
			dest.WriteRune(error)
			fmt.Fprintf(&dest, "  %-6d", errorCount)
			for i := 0; i < errorCount; i++ {
				dest.WriteRune('*')
			}
		}
	}
	return dest.String()
}