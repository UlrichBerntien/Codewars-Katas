package kata

// Makes array {x,2*x,3*x,...,n*x}.
func CountBy(x, n int) []int {
  result := make([]int,n)
  accu := x
  for i := range result {
    result[i] = accu
    accu += x
  }
  return result
}
