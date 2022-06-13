package kata

// Convert number n to decimal digits.
// Digits in Little-Endian order.
func toDecimalDigits(n int) []byte {
	accu := make([]byte, 0, 20)
	for n > 0 {
		accu = append(accu, byte(n%10))
		n /= 10
	}
	return accu
}

// Convert decimal digits to integer number.
func fromDecimalDigits(digits []byte) int {
	var sum int = 0
	for i := len(digits) - 1; i >= 0; i-- {
		sum = sum*10 + int(digits[i])
	}
	return sum
}

func DeleteDigit(n int) int {
	digits := toDecimalDigits(n)
	// Search position of the digit to delete
	i := len(digits) - 1
	for i > 0 && digits[i] >= digits[i-1] {
		i--
	}
	// Delete digit at index i
	copy(digits[i:], digits[i+1:])
	digits = digits[:len(digits)-1]
	return fromDecimalDigits(digits)
}
