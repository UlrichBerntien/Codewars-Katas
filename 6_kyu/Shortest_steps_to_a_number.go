package kata

func ShortestStepsToNum(n int) int {
  var counter int = 0
  for n > 1 {
    if n & 1 > 0 {
      counter += 1
      n -= 1
    }
    counter += 1
    n /= 2
  }
  return counter
}
