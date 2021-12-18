package kata

import "strings"

func pattern(rows int, columns int, str string) string {
	// Write one rune in a cell (not one byte) 
	runes := []rune(str)
	// Index of next rune to write
	runeIndex := 0
  // Separator line in the grid
	separatorLine := "+" + strings.Repeat("---+", columns)
	// Collect the output in a string builder 
	var accu strings.Builder
	for rowIndex := 0; rowIndex < rows; rowIndex++ {
		accu.WriteString(separatorLine)
		accu.WriteString("\n|")
		for colIndex := 0; colIndex < columns; colIndex++ {
			if runeIndex < len(runes) {
				accu.WriteRune(' ')
				accu.WriteRune(runes[runeIndex])
				runeIndex++
				accu.WriteString(" |")
			} else {
				accu.WriteString("   |")
			}
		}
		accu.WriteRune('\n')
	}
	// Separator at end of the grid without \n
	accu.WriteString(separatorLine)
	return accu.String()
}
