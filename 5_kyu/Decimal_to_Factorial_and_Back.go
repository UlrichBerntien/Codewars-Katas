package kata

func value2char(v int) byte {
	switch {
	case v < 0:
		panic("digit out of range")
	case v < 10:
		return byte('0' + v)
	case v < 36:
		return byte('A' - 10 + v)
	default:
		panic("digit out of range")
	}
}

func char2value(c byte) int {
	switch {
	case '0' <= c && c <= '9':
		return int(c - '0')
	case 'A' <= c && c <= 'Z':
		return int(c - 'A' + 10)
	default:
		panic("digit out of range")
	}
}

func Dec2FactString(nb int) string {
	var digit [37]byte
	digitIndex := len(digit) - 1
	digit[digitIndex] = '0'
	value := 1
	for nb > 0 {
		digitIndex--
		if digitIndex < 0 {
			panic("number out of range")
		}
		value++
		digit[digitIndex] = value2char(nb % value)
		nb /= value
	}
	return string(digit[digitIndex:])
}

func FactString2Dec(str string) int {
	accu := 0
	value := len(str)
	for i := 0; i < len(str); i++ {
		accu = accu*value + char2value(str[i])
		value--
	}
	return accu
}
