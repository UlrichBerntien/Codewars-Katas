module Solution
  export seatsintheater
  
  """
    Counts the number of seats right behind seat col,row.
    ncols, nrows are the number of seat columns and seat rows.
    Seat position (col, row) starts with (1,1).
  """
  seatsintheater(ncols::Integer, nrows::Integer, col::Integer, row::Integer) = (nrows-row)*(ncols-col+1)
end
