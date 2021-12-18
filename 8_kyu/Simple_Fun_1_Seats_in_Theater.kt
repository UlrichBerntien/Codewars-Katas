fun seatsInTheater(nCols: Int, nRows: Int, col: Int, row: Int): Int =
    (nCols+1-col)*(nRows-row)