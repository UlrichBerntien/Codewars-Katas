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

// Rotates array of rune like Rot rotates a string
func rot(source []rune, N int) []rune {
	dest := make([]rune, len(source))
	// copy the runes rotated
	for rowIndex := 0; rowIndex < N; rowIndex++ {
		destStart := rowIndex * (N + 1)
		destEnd := (N-1)*(N+2) - destStart
		for colIndex := 0; colIndex < N; colIndex++ {
			dest[destStart+colIndex] = source[destEnd-colIndex]
		}
	}
	insertLineEnds(dest, N)
	return dest
}

func Rot(s string) string {
	source := []rune(s)
	N := findN(source)
	return string(rot(source, N))
}

func SelfieAndRot(s string) string {
	self := []rune(s)
	N := findN(self)
	outN := N + N
	canvas := make([]rune, outN*(outN+1)-1)
	rot := rot(self, N)
	// prepare canvas
	for i := range canvas {
		canvas[i] = '.'
	}
	// insert self on canvas
	for rowIndex := 0; rowIndex < N; rowIndex++ {
		destStart := rowIndex * (outN + 1)
		copy(canvas[destStart:destStart+N], self[rowIndex*(N+1):])
	}
	// insert rotated on canvas
	for rowIndex := 0; rowIndex < N; rowIndex++ {
		destStart := (rowIndex+N)*(outN+1) + N
		copy(canvas[destStart:destStart+N], rot[rowIndex*(N+1):])
	}
	insertLineEnds(canvas, outN)
	return string(canvas)
}

func Oper(f FParam, x string) string {
	return f(x)
}
