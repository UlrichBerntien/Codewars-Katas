package kata

import (
	"math"
	"strings"
)

func Solve(n int) string {
	// Store result in string builder without temporary strings
	var accu strings.Builder
	// Set buffer length to increase speed
	// Approximation based on Binet formula
	lengthApprox := int(math.Pow(1.6180339, float64(n+1)) / 2.236067977)
	accu.Grow(lengthApprox)
	i := 0
	if i <= n {
		accu.WriteRune('0')
		i++
	}
	if i <= n {
		accu.WriteRune('1')
		i++
	}
	stringIminus1len := 1
	for i <= n {
		l := accu.Len()
		accu.WriteString(accu.String()[:stringIminus1len])
		stringIminus1len = l
		i++
	}
	return accu.String()
}
