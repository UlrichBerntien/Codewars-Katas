package kata

import "math"

// Generate table of the PI digits sum.
// item i = sqrt(sum of first (i digits squared)).
func tableGenerator() []int {
	digits := "31415926535897932384626433832795028841971693993751058209749445923078164062862089986280348253421170679"
	squares := make([]int, len(digits))
	sum := 0.0
	for i, d := range digits {
		value := d - '0'
		sum += float64(value * value)
		squares[i] = int(math.Ceil(math.Sqrt(sum)))
	}
	return squares
}

// Calculate the table only once.
var squarePiTable []int = tableGenerator()

func SquarePi(digits int) int {
	if digits < 1 || digits > len(squarePiTable) {
		panic("argument out of range")
	}
	return squarePiTable[digits-1]
}
