package kata

// Converts number n to reversed array of digits.
func Digitize(n int) []int {
	if n < 0 {
    // Also return the digits of negative numbers.
		n = -n
	}
	if n == 0 {
    // Special case 0
		return []int{0}
	}
  // Calculate the decimal digits of a positive number n.
	accu := make([]int, 0, 20)
	for n > 0 {
		accu = append(accu, n%10)
		n /= 10
	}
	return accu
}
