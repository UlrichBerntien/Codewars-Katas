package kata

// Returns True if n is a Wilson prime number.
// Warnung: if n > 5×10^8 the result could be false negative.
func AmIWilson(n int) bool {
  // https://simple.wikipedia.org/wiki/Wilson_prime
  return n == 5 || n == 13 || n == 563
}
