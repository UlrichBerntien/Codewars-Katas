package kata

import "math/bits"

// Return list of 0..2^n-1 with all 1 bits in b are also in the list item.
func Solution(n, b int) []int {
	if b <= 0 {
		// for b=0 as defined, and for b<0 as error exit
		return []int{}
	}
	limit := 1 << n
  if limit == 0 {
    panic("out of integer range")
  }
	// accelerate the loop
	step := 1
	for b&step > 0 {
		step <<= 1
	}
	// Each 1 bit of b reduced the result len to 1/2
	accu := make([]int, 0, limit/bits.OnesCount(uint(b)))
	for i := b; i < limit; i += step {
		if i&b == b {
			accu = append(accu, i)
		}
	}
	return accu
}
