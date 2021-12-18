package kata

func Divisors(n int) int {
	count := 1
	for div := 2; n >= div; div++ {
		countOld := count
		for n%div == 0 {
			n /= div
			count += countOld
		}
	}
	return count
}
