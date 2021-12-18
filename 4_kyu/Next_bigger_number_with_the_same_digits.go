package kata

import "sort"

// Converts a non-negative number in array of digits.
// Use base 10. Index i has power 10**i.
func int2digits(n int) []int {
	if n < 0 {
		panic("can't handle negative ints")
	}
	if n == 0 {
		return []int{0}
	}
	digits := make([]int, 0, 20) // int64 optimized
	for n > 0 {
		digits = append(digits, n%10)
		n /= 10
	}
	return digits
}

// Converts array of digits into integer number.
func digits2int(digits []int) int {
	accu := 0
	for i := len(digits) - 1; i >= 0; i-- {
		accu = accu*10 + digits[i]
	}
	return accu
}

// Finds index of the smallest digit above limit.
func upperIndex(digits []int, limit int) int {
	result := -1
	max := -1
	for i, d := range digits {
		if d > limit && (max < 0 || d < max) {
			result = i
			max = d
		}
	}
	return result
}

func NextBigger(n int) int {
	digits := int2digits(n)
	// Search the digit to raise
	max := digits[0]
	changeIdx := 1
	for changeIdx < len(digits) && digits[changeIdx] >= max {
		max = digits[changeIdx]
		changeIdx++
	}
	if changeIdx == len(digits) {
		return -1
	}
	// Rearrange the lower significant digits
	aboveIdx := upperIndex(digits[0:changeIdx], digits[changeIdx])
	digits[changeIdx], digits[aboveIdx] = digits[aboveIdx], digits[changeIdx]
	sort.Sort(sort.Reverse(sort.IntSlice(digits[0:changeIdx])))
	return digits2int(digits)
}
