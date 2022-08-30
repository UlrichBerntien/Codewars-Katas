package kata

import "strings"

const (
	dot   rune = '■'
	space rune = '□'
	eol   rune = '\n'
)

// Generats an "ASCII art" string.
// The string printed is a nxn sized X.
func X(n int) string {
	var accu strings.Builder
	accu.Grow(n*n + n)
	// Append one rune to the accu.
	add := func(r rune) {
		accu.WriteRune(r)
	}
	// Append a rune n-times to the accu
	addN := func(r rune, n int) {
		for i := 0; i < n; i++ {
			accu.WriteRune(r)
		}
	}
	// Append one line to the accu.
	// One line is:
	// "space x outer, dot space x inner, dot, space x outer"
	addLine := func(outer int, inner int) {
		addN(space, outer)
		add(dot)
		if inner > 0 {
			addN(space, inner)
			add(dot)
		}
		addN(space, outer)
	}
	outer := 0
	inner := n - 2
	// Draw upper part of the X without the central dot.
	for inner > 0 {
		addLine(outer, inner)
		add(eol)
		outer++
		inner -= 2
	}
	// Draw lower part of the X with the central dot.
	for {
		addLine(outer, inner)
		outer--
		inner += 2
		if inner >= n {
			break
		}
		add(eol)
	}
	return accu.String()
}
