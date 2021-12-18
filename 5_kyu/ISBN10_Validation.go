package kata

func ValidISBN10(isbn string) bool {
	if len(isbn) != 10 {
		// ISBN-10 must be a 10 byte string
		return false
	}
	// calculate checksum
	accu := 0
	for i, c := range isbn[:9] {
		n := int(c - '0')
		if n < 0 || n > 9 {
			return false
		}
		accu += n * (i + 1)
	}
	accu %= 11
	// compare checksum
	check := byte('0' + accu)
	if check > '9' {
		// special case: lower case x is also valid
		return isbn[9] == 'X' || isbn[9] == 'x'
	} else {
		return isbn[9] == check
	}
}
