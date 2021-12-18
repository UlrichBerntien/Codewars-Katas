package kata

func Perimeter(n int) int {
  s, a, b := 0, 1, 0
  for n >= 0 {
    s, a, b = s+a, a+b, a
    n--
  }
  return 4*s
}