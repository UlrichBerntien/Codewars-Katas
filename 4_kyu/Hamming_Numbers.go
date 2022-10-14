package kata

// Cache of calculated Hamming Numbers
var hammingNumbers = []uint{1}

// Current candiates for next smallest number
// next smallest hamming number ×2, ×3, ×5
var candi2, candi3, candi5 uint = 2, 3, 5

// Index of current candidates ×2, ×3, ×5
var index2, index3, index5 uint = 0, 0, 0

// The minimum of 3 numbers
func min(a, b, c uint) uint {
	if a < b {
		if a < c {
			return a
		} else {
			return c
		}
	} else {
		if b < c {
			return b
		} else {
			return c
		}
	}
}

// Calculate the smallest Hamming Numbers in 1024 packs
// No return, stores the numbers in the cache.
func calculateHamming(upto int) {
	// Round up to 1'024 blocks of numbers
	upto = (1 + upto>>10) << 10
	// Count of numbers to create
	missing := upto - len(hammingNumbers)
	for i := 0; i < missing; i++ {
		// Append the smallest candidate
		smallest := min(candi2, candi3, candi5)
		hammingNumbers = append(hammingNumbers, smallest)
		// Calculate the next candidate(s)
		if smallest == candi2 {
			index2++
			candi2 = uint(2) * hammingNumbers[index2]
		}
		if smallest == candi3 {
			index3++
			candi3 = uint(3) * hammingNumbers[index3]
		}
		if smallest == candi5 {
			index5++
			candi5 = uint(5) * hammingNumbers[index5]
		}
	}
}

// Calculate n-th smallest Hamming Number
// see https://en.wikipedia.org/wiki/Regular_number
func Hammer(n int) uint {
	if n <= 0 {
		panic("invalid argument: n not positive")
	}
	if len(hammingNumbers) < n {
		calculateHamming(n)
	}
	return hammingNumbers[n-1]
}
