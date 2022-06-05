package kata

func makeMatrix(rows, cols int) [][]int {
	result := make([][]int, rows)
	for r := range result {
		result[r] = make([]int, cols)
	}
	return result
}

func Transpose(matrix [][]int) [][]int {
	if len(matrix) < 1 {
		// special case 0x0 matrix
		return matrix
	}
	srcRowIndexs := len(matrix)
	srcColIndexs := len(matrix[0])
	result := makeMatrix(srcColIndexs, srcRowIndexs)
	for srcRowIndex := 0; srcRowIndex < srcRowIndexs; srcRowIndex++ {
		row := matrix[srcRowIndex]
		for srcColIndex := 0; srcColIndex < srcColIndexs; srcColIndex++ {
			result[srcColIndex][srcRowIndex] = row[srcColIndex]
		}
	}
	return result
}
