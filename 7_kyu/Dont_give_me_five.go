package kata

// Has the decimal number a digit?
func hasDigit(number, digit int) bool {
	if number < 0 {
		number = -number
	}
	for number > 0 {
		if number%10 == digit {
			return true
		}
		number /= 10
	}
	return false
}

// Counts all decimal numbers in range start ... end which have no digit 5.
func DontGiveMeFive(start int, end int) int {
	count := 0
	for i := start; i <= end; i++ {
		if !hasDigit(i, 5) {
			count++
		}
	}
	return count
}
