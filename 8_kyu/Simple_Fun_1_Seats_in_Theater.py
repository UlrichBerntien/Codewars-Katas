def seats_in_theater(tot_cols, tot_rows, col, row):
    """
    Calculates number of seats strictly+left behind
    tot_cols -- number of seat columns
    tot_rows -- number of seat rows
    col -- seat column position, 1..nCols
    row -- seat row position, 1..nRows
    return -- Number of seats strictly+left behind 
    """
    return (tot_cols+1-col)*(tot_rows-row)