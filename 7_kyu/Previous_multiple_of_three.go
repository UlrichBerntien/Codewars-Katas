package kata

func PrevMultOfThree(n int) interface{} {
	for n % 3 > 0 {
		n /= 10
	}
	if n > 0 {
		return n
	} else {
		return nil
	}
}
