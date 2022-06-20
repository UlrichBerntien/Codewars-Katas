package kata

// Creates an array of n values.
// The values are alternatend first, second, first, ...
func Alternate(n int, firstValue string, secondValue string) []string {
  if n < 0 {
    // error case
    panic("argument: negative length")
  }
  arr := make([]string, 0, n)
  for remaining := n; remaining > 0; remaining-- {
    arr = append(arr, firstValue)
    remaining--
    if remaining > 0 { 
      arr = append(arr, secondValue)
    }
  }
  return arr
}
