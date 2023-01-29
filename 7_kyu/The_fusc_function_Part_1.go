package kata

func Fusc(n int) int {
	for n > 0 && n % 2 == 0 {
		n /= 2
	}
	if n < 2 {
		return n
	} else {
		n /= 2
		return Fusc(n) + Fusc(n+1)
	}
}
