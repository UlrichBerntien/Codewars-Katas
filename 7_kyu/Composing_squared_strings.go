package kata

func measureN(r []rune) int {
	n := 0
	for n < len(r) && r[n] != '\n' {
		n++
	}
	// check
	if len(r) != n*(n+1)-1 {
		return -1
	}
	return n
}

func Compose(s1, s2 string) string {
	r1 := []rune(s1)
	r2 := []rune(s2)
	n1 := measureN(r1)
	n2 := measureN(r2)
	if n1 < 1 || n1 != n2 {
		return ""
	}
	n := n1
	result := make([]rune, n*(n+2)-1)
	for row := 0; row < n; row++ {
		resultOffset := row * (n + 2)
		r1Offset := row * (n + 1)
		r2Offset := (n-1-row)*(n+1) - (row + 1)
		for i := 0; i <= row; i++ {
			result[resultOffset+i] = r1[r1Offset+i]
		}
		for i := row + 1; i <= n; i++ {
			result[resultOffset+i] = r2[r2Offset+i]
		}
	}
	for i := n + 1; i < len(result); i += n + 2 {
		result[i] = '\n'
	}
	return string(result)
}

