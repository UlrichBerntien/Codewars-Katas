package kata

// internal id codes for the colors
const (
	red   int8 = 0
	green int8 = 1
	blue  int8 = 2
)

// Color triangels.
// The two base line colors are the index "colorA*4+colorB".
// The value is the color at the edge.
// Factor 4 is used for fast multiplication (2 shifts)
var colorTriangle [12]int8 = [12]int8{
	red, blue, green, 0, // index in the row: red*4 + red/green/blue/unused
	blue, green, red, 0, //                   green*4 + red/green/blue/unused
	green, red, blue, 0, //                   blue*4 + red/green/blue/unused
}

// Converts internal code to color character.
func i2rune(i int8) rune {
	return [3]rune{'R', 'G', 'B'}[i]
}

// Converts color character to internal code.
func rune2i(r rune) int8 {
	switch r {
	case 'R':
		return red
	case 'G':
		return green
	case 'B':
		return blue
	default:
		panic("unknown color character")
	}
}

// Converts color string to internal code array.
func string2i(s string) []int8 {
	// it must be len(s) == len([]rune{s} because only RGB chars are allowed
	result := make([]int8, len(s))
	for i, r := range s {
		result[i] = rune2i(r)
	}
	return result
}

// Calculates the triangle top color.
// The function works on the array a and modifies the content.
func triangle(a []int8) int8 {
	n := len(a)
	for n > 1 {
		n--
		for i := 0; i < n; i++ {
			a[i] = colorTriangle[a[i]*4+a[i+1]]
		}
	}
	return a[0]
}

// Calculate the triangle top for the given base line.
func Triangle(row string) rune {
	if len(row) == 0 {
		panic("empty argument")
	}
	colors := string2i(row)
	return i2rune(triangle(colors))
}
