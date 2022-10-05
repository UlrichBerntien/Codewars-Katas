package kata

import "math"

// Calculates a minimal integer i with i > val and i=integer^pow.
func FindNextPower(val, pow int) int {
  // calculate all with floats, because float library exists
	limit := float64(val)
	p := float64(pow)
  // i := round up p-root of val
	i := math.Ceil(math.Exp2(math.Log2(limit) / p))
	var upper float64
  // may by the p-root was an integer, then one increment is needed
	for {
		upper = math.Pow(i, p)
		if upper > limit {
			break
		}
		i++
	}
	return int(upper)
}
