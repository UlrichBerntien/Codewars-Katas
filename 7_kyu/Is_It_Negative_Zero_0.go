package kata

import "math"

// Return True if n is -0, else return false.
// REQUIRES float in IEEE 754 format.
func IsNegativeZero(n float64) bool {
  return math.Float64bits(n) == 0x8000_0000_0000_0000
}
