package kata

// Calculates number of jumps from start to finish.
func Cats(start, finish int) int {
  if finish < start {
    panic("argument error: finish < start")
  }
  delta := finish - start
  // Cat can jump over one shelf "/3" but must go the last steps "delta %3"
  return delta / 3 + delta % 3
}
