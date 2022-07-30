package kata

// Return final weight of the dried potatoes.
// p0: initial percent (1..100) of water
// w0: initial weight
// p1: final percent of water
// Return is truncated to integer
func Potatoes(p0, w0, p1 int) int {
  return int( float64(w0) * float64(100-p0)/float64(100-p1) )
}