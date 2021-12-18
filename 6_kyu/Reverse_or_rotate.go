package kata

// Check if sum of all digits square is even
func isSumDiv2(chunk []rune) bool {
	sum := 0
	for _, r := range chunk {
		sum += int(r-'0') % 2
	}
	return sum%2 == 0
}

// Reverse the content of the slice in place.
func reverseInPlace(chunk []rune) {
	last := len(chunk) - 1
	for index := 0; index <= last/2; index++ {
		chunk[index], chunk[last-index] = chunk[last-index], chunk[index]
	}
}

// Rotate left the content of the slice one element.
func rotateInPlace(chunk []rune) {
	first := chunk[0]
	for index := 1; index < len(chunk); index++ {
		chunk[index-1] = chunk[index]
	}
	chunk[len(chunk)-1] = first
}

func Revrot(s string, n int) string {
	if n <= 0 || len(s) < n {
		return ""
	} else {
		runes := []rune(s)
		nrChunks := len(s) / n
		for startIndex := 0; startIndex+n <= len(s); startIndex += n {
			chunk := runes[startIndex : startIndex+n]
			if isSumDiv2(chunk) {
				reverseInPlace(chunk)
			} else {
				rotateInPlace(chunk)
			}
		}
		return string(runes[:nrChunks*n])
	}
}
