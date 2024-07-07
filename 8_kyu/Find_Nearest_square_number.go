package kata

import "math"

// Returns the nearest integer which is a square.
func NearestSq(n int) int {
  return int(math.Pow(math.Round(math.Sqrt(float64(n))),2.))
}
