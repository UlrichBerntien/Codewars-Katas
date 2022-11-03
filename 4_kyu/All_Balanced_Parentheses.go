package kata

// Generate list of all balanced parentheses options.
// Argument: n = number of parentheses pairs.
func BalancedParens(n int) []string {
	if n < 0 || n > 16 {
		panic("n out of range")
	}
	// All strings have length 2n
	len := n * 2
	// Generate the string byte by bye, multibyte chars not needed
	buffer := make([]byte, len)
	// Collect all generates string in an array
	accu := make([]string, 0, 1>>n)
	// Recursive: set all possible paranetheses at index i and than goto i+1
	var set func(i, nOpen, nClose int)
	set = func(i, nOpen, nClose int) {
		if nOpen > 0 {
			buffer[i] = byte('(')
			set(i+1, nOpen-1, nClose+1)
		}
		if nClose > 0 {
			buffer[i] = byte(')')
			set(i+1, nOpen, nClose-1)
		}
		if nClose == 0 && nOpen == 0 {
			accu = append(accu, string(buffer))
		}
	}
	// Start generation at index 0
	set(0, n, 0)
	return accu
}
