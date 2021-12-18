package kata

// Count the number of digit d in decimal number i
func countDigit(i, d int) int {
	if i == 0 && d == 0 {
		return 1
	}
	count := 0
	for i > 0 {
		if i%10 == d {
			count++
		}
		i /= 10
	}
	return count
}

func NbDig(n int, d int) int {
	count := 0
	for i := 0; i <= n; i++ {
		count += countDigit(i*i, d)
	}
	return count
}
