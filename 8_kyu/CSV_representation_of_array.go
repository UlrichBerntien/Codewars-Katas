package kata

import (
	"bytes"
	"fmt"
)

// Writes integer array CVS formated in string.
func ToCsvText(array [][]int) string {
	last_row := len(array) - 1
	if last_row < 0 {
		return ""
	}
	last_col := len(array[0]) - 1
	var accu bytes.Buffer
	for row_index, row := range array {
		for col_index, nr := range row {
			fmt.Fprint(&accu, nr)
			if col_index < last_col {
				accu.WriteRune(',')
			} else if row_index < last_row {
				accu.WriteRune('\n')
			}
		}
	}
	return accu.String()
}
