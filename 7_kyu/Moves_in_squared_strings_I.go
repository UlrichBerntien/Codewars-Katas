package kata

type FParam func(string) string

// Finds the len of a row and the number of the rows
func findN(r []rune) int {
	n := 0
	for n < len(r) && r[n] != '\n' {
		n++
	}
	if n*(n+1)-1 != len(r) {
		panic("no squared string")
	}
	return n
}

// Inserts the line ends (\n) in the squared strings array
func insertLineEnds(r []rune, N int) {
	// insert the line ends
	for lineIndex := 1; lineIndex < N; lineIndex++ {
		r[lineIndex*(N+1)-1] = '\n'
	}
}

func VertMirror(s string) string {
	source := []rune(s)
	dest := make([]rune, len(source))
	N := findN(source)
	// copy the runes vertical mirrored
	for rowIndex := 0; rowIndex < N; rowIndex++ {
		rowStart := rowIndex * (N + 1)
		rowEnd := rowStart + N - 1
		for colIndex := 0; colIndex < N; colIndex++ {
			dest[rowStart+colIndex] = source[rowEnd-colIndex]
		}
	}
	insertLineEnds(dest, N)
	return string(dest)
}

func HorMirror(s string) string {
	source := []rune(s)
	dest := make([]rune, len(source))
	N := findN(source)
	// copy the runes horizontal mirrored
	for rowIndex := 0; rowIndex < N; rowIndex++ {
		destStart := rowIndex * (N + 1)
		sourceStart := (N-1)*(N+1) - destStart
		copy(dest[destStart:destStart+N], source[sourceStart:])
	}
	insertLineEnds(dest, N)
	return string(dest)
}

func Oper(f FParam, x string) string {
	return f(x)
}
