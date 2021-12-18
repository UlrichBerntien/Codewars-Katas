package kata

import (
	"math"
	"strconv"
)

func IterPi(epsilon float64) (int, string) {
	count := 1
	approx := float64(4)
	divisor := float64(-3)
	for math.Abs(math.Pi-approx) > epsilon {
		approx += 4. / divisor
		divisor = -(divisor + math.Copysign(2., divisor))
		count++
	}
	return count, strconv.FormatFloat(approx, 'f', 10, 64)
}
