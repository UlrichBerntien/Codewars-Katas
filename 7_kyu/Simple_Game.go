package kata


func Game(n, m int) string {
  if n & 1 != 0 && m > 2 {
    return "first"
  } else {
    return "second"
  }
}