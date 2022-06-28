package kata

// Get the one or two characters in the middle of the string.
func GetMiddle(s string) string {
  // Use runes to handle multi-byte characters in the string.
  runes := []rune(s)
  l := len(runes)
  if l < 3 {
    // 0, 1 or 2 runes: return the string unchanged.
    return s
  }
  // The runes in the middle, 1 rune if odd, 2 runes if even.
  return string(runes[(l-1)/2:l/2+1])
}
