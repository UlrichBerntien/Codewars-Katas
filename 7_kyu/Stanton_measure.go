package kata

// Count of item x in the arr.
func count(arr []int, x int) int {
  counter := 0
  for _,v := range arr {
    if v == x {
      counter += 1
    }
  }
  return counter
}

// Calculates the stanton measure of the array.
// The count of items with the value equal to the count of 1.
func StantonMeasure(arr []int) int {
  return count( arr, count( arr, 1 ) );
}
