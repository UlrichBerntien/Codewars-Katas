package kata

// Sum of all integers in arr.
// LIMITATION: sums must in int64 range.
func sum(arr []int) int64 {
  var accu int64 = 0
  for _, it := range arr {
    accu += int64(it)
  }
  return accu
}

// Find index i so that arr[:i] = arr[i+1:].
// Item i is not part of the sums.
// Returns -1 if no such index exists.
func FindEvenIndex(arr []int) int {
  if len(arr) == 0 {
    return 0
  }
  // Integer arithmetix is fast. So no caching of the partial sums.
  s := sum(arr)
  var left int64 = 0
  var right int64 = s
  for index, it := range arr {
    it64 := int64(it)
    right -= it64
    if left == right {
      return index
    }
    left += it64
  }
  return -1
}
