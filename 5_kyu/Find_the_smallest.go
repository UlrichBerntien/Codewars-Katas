package kata

import "sort"

// Converts number into digits.
// Weight of digit i is i**10.
func number2digits(n int64) []int8 {
	d := make([]int8, 0, 20)
	if n < 0 {
		panic("negative number")
	}
	for n > 0 {
		d = append(d, int8(n%10))
		n /= 10
	}
	return d
}

// Converts digits into number value.
func digits2number(digits []int8) (accu int64) {
	for i := len(digits) - 1; i >= 0; i-- {
		accu = accu*10 + int64(digits[i])
	}
	return
}

type changedNumber struct {
	digit []int8 // changed number
	src   int    // cut index in the array digit
	dst   int    // paste index in the array digit
}

// Checks if the change results in a new minimum.
// An empty len(digit)==0  mimimum as input is allowed.
func checkChange(old changedNumber, digit []int8, src, dst int) changedNumber {
	test := changedNumber{digit: make([]int8, len(digit)), src: src, dst: dst}
	var i, j int
	for {
		if i == src {
			i++
		}
		if j == dst {
			j++
		}
		if i == len(digit) || j == len(digit) {
			break
		}
		test.digit[j] = digit[i]
		i++
		j++
	}
	test.digit[dst] = digit[src]
	if len(old.digit) == 0 {
		// No other number to compare
		return test
	}
	// compare the two changes by number value and index value
	var delta int8
	for i := len(digit) - 1; i >= 0 && delta == 0; i-- {
		delta = test.digit[i] - old.digit[i]
	}
	if delta < 0 {
		return test
	}
	if delta > 0 {
		return old
	}
	if test.src > old.src {
		return test
	}
	if old.src > test.src {
		return old
	}
	if test.dst > old.dst {
		return test
	}
	return old
}

// Find the smallest on the reduced number.
// The smallest number will start with min, the smallest digit.
// The returned src, dst are the indices in the array d to cut and insert.
func smallest(digit []int8, min int8) changedNumber {
	topD := len(digit) - 1
	var minimum changedNumber
	// Check option to cut top digit
	if topD > 0 && digit[topD-1] == min {
		dst := topD - 1
		for dst > 0 && digit[dst-1] <= digit[topD] {
			dst--
		}
		minimum = checkChange(minimum, digit, topD, dst)
	}
	// Check all options to cut a digit with minimal value and insert it at top.
	for idx := 0; idx < topD; idx++ {
		if digit[idx] == min {
			minimum = checkChange(minimum, digit, idx, topD)
		}
	}
	return minimum
}

func Smallest(n int64) []int64 {
	// d = digits in the order of the given number
	d := number2digits(n)
	lastD := len(d) - 1
	// s = digits in order of smallest possible number by permutations
	s := make([]int8, len(d))
	copy(s, d)
	sort.Slice(s, func(i, j int) bool { return s[i] > s[j] })
	// strip the topmost digits already which are already minimal
	top := lastD
	for top > 0 && d[top] == s[top] {
		top--
	}
	if top == 0 {
		// the number is alread minimal
		return []int64{n, 0, 0}
	}
	// minimise the reduced number
	optimum := smallest(d[:top+1], s[top])
	copy(d[:top+1], optimum.digit)
	// Optimise the destination index without changing the number
	// Same topmost digits could be used to insert on higher index
	for optimum.dst < lastD && d[optimum.dst+1] == d[optimum.dst] {
		optimum.dst++
	}
	return []int64{digits2number(d), int64(lastD - optimum.src), int64(lastD - optimum.dst)}
}
