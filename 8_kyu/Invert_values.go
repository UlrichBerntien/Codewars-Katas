package kata

// Returns a copy of the arr with each item inverted (-item).
func Invert(arr []int) []int {
  invers := make([]int,0,len(arr))
  for _,x := range arr {
    invers = append(invers,-x)
  }
  return invers
}
