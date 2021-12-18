package kata

func seatsInTheater(nCols int, nRows int, col int, row int) int {
    return (nCols+1-col) * (nRows-row)
}