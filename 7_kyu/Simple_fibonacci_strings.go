package kata

import (
	"math"
	"strings"
)

// Appends finoacci string n to the string builder accu.
func add(accu *strings.Builder, n int) {
	switch n {
	case 0:
		accu.WriteRune('0')
	case 1:
		accu.WriteRune('0')
		accu.WriteRune('1')
	default:
		add(accu, n-1)
		add(accu, n-2)
	}
}

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
    accu.WriteString( accu.String()[:stringIminus1len] )
    stringIminus1len = l
    i++
  }
  
	//add(&accu, n)
	return accu.String()
}
