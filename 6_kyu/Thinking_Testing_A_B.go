package kata

func crossSum(x int) int {
	var sign int
	if x < 0 {
		sign = -1
		x = -1
	} else {
		sign = +1
	}
	accu := 0
	for x > 0 {
		accu += x % 10
		x /= 10
	}
	return sign * accu
}

func TestIt(a, b int) int {
	return crossSum(a) * crossSum(b)
}
