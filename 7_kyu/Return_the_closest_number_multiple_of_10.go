package kata


// Round number to multiple of 10.
func ClosestMultipleOf10(n uint32) uint32 {
  n += 5
  n -= n % 10
  return n
}