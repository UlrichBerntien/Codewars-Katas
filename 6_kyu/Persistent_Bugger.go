package kata

func Persistence(n int) int {
	counter := 0
	for n > 9 {
		// calculate product of all digits
		product := 1
		for n > 0 {
			product *= n % 10
			n /= 10
		}
		n = product
		counter++
	}
	return counter
}
