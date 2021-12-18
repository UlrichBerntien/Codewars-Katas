package kata

func NextHigher(n int) int {
	mask := ^0
	accu := 0
	bit1 := 1
	for bit1 > 0 && n|bit1 != n {
		mask <<= 1
		bit1 <<= 1
	}
	for bit1 > 0 && n|bit1 == n {
		mask <<= 1
		accu = accu<<1 + 1
		bit1 <<= 1
	}
	return (n & mask) + bit1 + (accu >> 1)
}
