package kata

// Returns True if a and b have no 1 bit at same position.
func Interlockable(a, b uint64) bool {
  return a & b == 0
}
