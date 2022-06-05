package kata

// Sum of numbers 1 + 2 + ... + last.
func gauss(last int) int {
	return (last * (last + 1)) / 2
}

func Multiple3And5(number int) int {
	n := number - 1
	// All multiples of 3: 1*3 + 2*3 + 3*3, ...
	// + all multiples of 5: 1*5 + 2*5 + 3*5, ...
	// - all multiples of 15: 1*15 + 2*15 + 3*15, ...
	return 3*gauss(n/3) + 5*gauss(n/5) - 15*gauss(n/15)
}
