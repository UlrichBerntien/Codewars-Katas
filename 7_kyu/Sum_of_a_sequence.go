package kata


// Calculates the sum of sequence
//    start, start+step, start+2*step, ..., x.
// with x <= end
func SequenceSum(start, end, step int) int {
  // Use Gauss sum formula
  n := (step+end-start)/step
  if n <= 0 {
    // Case start > end
    return 0
  }
  return start * n + step*(((n-1)*n) / 2)
}
