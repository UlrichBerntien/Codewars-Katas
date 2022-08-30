package kata

// Returns concatenation of the string "short+long+short"
// where short/long is the shortest/longest string of a,b.
func Solution(a, b string) string {
  if len(a) < len(b) {
    return a+b+a
  } else {
    return b+a+b    
  }
}
