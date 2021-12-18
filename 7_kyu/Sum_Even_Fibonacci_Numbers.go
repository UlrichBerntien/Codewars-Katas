package kata

func SumEvenFibonacci(limit int) (sum int) {
    a,b := 1,2
    for a <= limit {
      a,b = b,a+b
      if a & 1 == 0 { sum += a }
    }
    return sum
}