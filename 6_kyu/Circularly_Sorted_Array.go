package kata

func IsCircleSorted(r []int) bool {
  n := len(r)
  index := 1
  // first part of the array is acending orderd
  for index < n && r[index-1] <= r[index] {
    index++
  }
  if index < n {
    // second part must be also acending orderd
    index++
    for index < n && r[index-1] <= r[index] {
      index++
    }
    // and must be below the first part
    if index < n || r[0] < r[n-1] {
      return false
    }
  }
  return true
}