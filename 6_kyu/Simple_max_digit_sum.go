package kata 

func int2digits(n int) []int {
  if n <= 0 {
    return []int{0}
  }
  var digits []int
  for n > 0 {
    digits = append(digits, n % 10)
    n /= 10
  }
  return digits
}

func digits2int(digits []int) int {
  accu := 0
  for index := len(digits)-1; index >= 0; index-- {
    accu = accu * 10 + digits[index]
  }
  return accu
}

func Solve(n int) int {
  digits := int2digits(n)
  options := 0
  for index, value := range digits {
    if value > 0 && options > 1 {
      digits[index]--
      for subindex := 0; subindex < index; subindex++ {
        digits[subindex] = 9
        }
      options = 0
      }
    options += 9 - digits[index]
  }
  return digits2int(digits)
}