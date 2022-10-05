package kata

// Cache data of inc- or  decreasing numbers
type reasing_t struct {
	// Count of inc/decreasing numbers
	//    index: number of digits
	//    value: number of inc/decreasing numbers
	count []uint64
	// Count of  inc/decreasing numbers selected by topmost digit
	//    index: value of topmost digit
	//    value: number of numbers with len(count) digits and the given topmost digit
	countWithStart [10]uint64
}

// Cache already calculated counts.
var decCache = reasing_t{count: []uint64{1, 10}, countWithStart: [10]uint64{1, 1, 1, 1, 1, 1, 1, 1, 1, 1}}
var incCache = reasing_t{count: []uint64{1, 10}, countWithStart: [10]uint64{1, 1, 1, 1, 1, 1, 1, 1, 1, 1}}

// Sum of all items in the array.
func sumuint64(a []uint64) uint64 {
	accu := uint64(0)
	for _, v := range a {
		accu += v
	}
	return accu
}

// Calculates the count of increasing or decreasing decimal numbers
// in the range 0..10^n.
func TotalIncDec(n int) uint64 {
	if n < 0 {
		// Error exit
		return 0
	}
	if n == 0 {
		// 10^0 = 1, only the number 0 exists
		return 1
	}
	// 10^n with n > 1: count all numbers with n digits.
	// e.g. 10^2 = 100, count all number with 2 digit 00,01,..,10,..,99
	// Calculate missing counts of increasing numbers
	for len(incCache.count) <= n {
		sum := incCache.countWithStart[9]
		for digit := 8; digit >= 0; digit-- {
			sum += incCache.countWithStart[digit]
			incCache.countWithStart[digit] = sum
		}
		incCache.count = append(incCache.count, sumuint64(incCache.countWithStart[:]))
	}
	// Calculate missing counts of decreasing numbers
	for len(decCache.count) <= n {
		decCache.countWithStart[0] = decCache.count[len(decCache.count)-1]
		sum := uint64(1)
		for digit := 1; digit < 10; digit++ {
			sum += decCache.countWithStart[digit]
			decCache.countWithStart[digit] = sum
		}
		decCache.count = append(decCache.count, sumuint64(decCache.countWithStart[:]))
	}
	// Numbers with all significant digits the same like "001", "011", "111", "002" .. "999"
	// are counted as decreasing and increasing.
	doubles := uint64(10)
	if n > 1 {
		doubles += uint64((n - 1) * 9)
	}
	// Count of decreasing + increasing numbers - count of numbers which are both
	return decCache.count[n] + incCache.count[n] - doubles
}
