package kata

import (
	"bytes"
	"strings"
)

// Constant elements to build the dot grid
const (
	dashElement = "+---"
	dashEnd     = "+\n"
	oElement    = "| o "
	oEnd        = "|\n"
)

// Generates a funy string of a grid with o's.
// e.g. width = 3, height = 2:
//    +---+---+---+\n
//    | o | o | o |\n
//    +---+---+---+\n
//    | o | o | o |\n
//    +---+---+---+
func Dot(width, height int) string {
	if width < 1 || height < 1 {
		panic("argument error")
	}
	// Combine the elements to the two lines
	dashLine := strings.Repeat(dashElement, width) + dashEnd
	oLine := strings.Repeat(oElement, width) + oEnd
	// Store the lines in a buffer
	var output bytes.Buffer
	output.Grow((height*2 + 1) * len(dashLine))
	for i := 0; i < height; i++ {
		output.WriteString(dashLine)
		output.WriteString(oLine)
	}
	// Last line without a \n at the end.
	output.WriteString(dashLine[:len(dashLine)-1])
	return output.String()
}
