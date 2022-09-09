package kata

// Rounds up to next multiple of 5.
func RoundToNext5(n int) int {
  rounded := (n/5)*5
  if rounded < n { rounded += 5 }
  return rounded
}
