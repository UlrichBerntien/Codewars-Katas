package kata

// Return index 0 the the element in the middle.
func Gimme(array [3]int) int {
  ab := array[0] < array[1]
  bc := array[1] < array[2]
  if ab == bc {
    return 1
  }
  ac := array[0] < array[2]
  if ab != ac {
    return 0
  }
  return 2
}
