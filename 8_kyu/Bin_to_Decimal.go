package kata

import (
	"math/bits"
	"strconv"
)

// Converts binary number to an integer.
// Returns -1 if the string is not a valid binary number.
func BinToDec(bin string) int {
	i64, err := strconv.ParseInt(bin, 2, bits.UintSize)
	if err != nil {
		// error exit
		return -1
	}
	return int(i64)
}
