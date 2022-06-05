package kata

import "sort"

func NextSmaller(n int) int {
	accu := n
	// Split the last digits of the number needs to form the next smaller number.
  // Optimisation done here: don't need to split all digits.
	digits := make([]int, 0, 24)
	lastDigit := 0
	for accu > 0 {
		lastDigit = accu % 10
		accu /= 10
		digits = append(digits, lastDigit)
		sort.Ints(digits)
		if lastDigit > digits[0] {
			// the top part of the number in accu will be unchanged
			break
		}
	}
	// Select the first digit of the digits according to:
	// - the number must be smaller
	// - the number must be the biggest of the smaller numbers
	// - the number must not start with 0
	i := 0
	for i+1 < len(digits) && digits[i+1] < lastDigit {
		i++
	}
	if (accu == 0 && digits[i] == 0) || digits[i] == lastDigit {
		// 0 is not allowed or no smaller number found
		return -1
	}
	// Move the selected digit to end of the array
	d := digits[i]
	copy(digits[i:], digits[i+1:])
	digits[len(digits)-1] = d
	// Rebuild the number from the splitted digits
	for i := len(digits) - 1; i >= 0; i-- {
		accu = accu*10 + digits[i]
	}
	return accu
}
