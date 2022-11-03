package kata

// Stores set of equal length byte arrays.
type stringStripes struct {
	c          []byte // string content
	startIndex []int  // start index of the sub strings in c
	len        int    // length of each string
}

// Returns true if b is a decimal digit (0..9).
// Supports one ASCII charset.
func isDigit(b byte) bool {
	return byte('0') <= b && b <= byte('9')
}

// Fast split into decimal numbers of equal length.
// Supports ASCII charset only.
func split(s string) stringStripes {
	accu := stringStripes{
		c:          []byte(s),
		startIndex: make([]int, 0, len(s)/10),
		len:        0,
	}
	for i := 0; i < len(accu.c); {
		// skip non digits
		for i < len(s) && !isDigit(accu.c[i]) {
			i++
		}
		if i >= len(s) {
			// No next number in the string
			break
		}
		if isDigit(accu.c[i]) {
			// start of next number
			accu.startIndex = append(accu.startIndex, i)
		}
		// skip digits
		for i < len(s) && isDigit(accu.c[i]) {
			i++
		}
		nowLen := i - accu.startIndex[len(accu.startIndex)-1]
		if accu.len == 0 {
			accu.len = nowLen
		} else if accu.len != nowLen {
			panic("number length not equal")
		}
	}
	return accu
}

// Ration of same bytes in equal length byte arrays.
// Returns 0 if no byte is equal.
func positionAverage(a, b []byte) float64 {
	if len(a) != len(b) {
		panic("not equal arguments")
	}
	count := uint(0)
	for i, v := range a {
		if v == b[i] {
			count++
		}
	}
	if count == 0 {
		return 0.0
	} else {
		return float64(count) / float64(len(a))
	}
}

// Ratio of same digits in set ot decimal numbers.
func PosAverage(s string) float64 {
	stripes := split(s)
	sum := float64(0)
	count := float64(0)
	for i := range stripes.startIndex {
		bi := stripes.c[stripes.startIndex[i] : stripes.startIndex[i]+stripes.len]
		for j := 0; j < i; j++ {
			bj := stripes.c[stripes.startIndex[j] : stripes.startIndex[j]+stripes.len]
			sum += positionAverage(bi, bj)
			count++
		}
	}
	if count > 0.0 {
		return 100.0 * sum / count
	} else {
		return 0.0
	}
}
