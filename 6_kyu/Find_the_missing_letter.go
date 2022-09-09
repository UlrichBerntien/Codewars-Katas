package kata

// Find missing letter in chars.
// Supports only ASCII letters.
func FindMissingLetter(chars []rune) rune {
  // Build map of chars in the argument, limited upto 'z'.
  var seen ['z'+1]bool
  for _,r := range chars {
    if r <= 'z' {
      seen[r] = true
    }
  }
  // Search missing charater
  for i := 'A'; i <= 'z'; i++ {
    if seen[i-1] && ! seen[i] {
      return i
    }
  }
  // No missing letter found
  return ' '
}
