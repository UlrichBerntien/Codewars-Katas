package kata

// Calculation fun with ASCII codes.
// Get all ASCII codes as decimal numbers.
// Add 6 for each digit '7' to the result number.
func Calc(s string) int {
	var result int
	// Scan string byte by byte. Assume pure 8-bit ASCII string.
	for _, code := range []byte(s) {
		// Translate ASCII code into decimal number
		for code > 0 {
			digit := code % 10
			code /= 10
			if digit == 7 {
				// Add 6 for each digit 7.
				result += 6
			}
		}
	}
	return result
}
