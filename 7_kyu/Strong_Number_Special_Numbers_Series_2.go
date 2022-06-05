package kata

// Table of factionals 0..9
var factional = [10]int{
	1,
	1,
	2,
	6,
	24,
	120,
	720,
	5040,
	40320,
	362880}

func strong(n int) bool {
	// Substract from n to avoid overflow during summation.
	accu := n
	for n > 0 {
		accu -= factional[n%10]
		if accu < 0 {
			// Quick exit.
			return false
		}
		n /= 10
	}
	return accu == 0
}

func Strong(n int) string {
	if strong(n) {
		return "STRONG!!!!"
	} else {
		return "Not Strong !!"
	}
}
