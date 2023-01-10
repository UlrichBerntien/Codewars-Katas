kata = {}

-- Calculates number of seats strictly+left behind
-- Arguments
--    nCols - number of seat columns
--    nRows - number of seat rows
--    col   - seat column position, 1..nCols
--    row   - seat row position, 1..nRows
-- Return
--    Number of seats strictly+left behind 
function kata.seatsInTheater(nCols, nRows, col, row)
  -- check arguments
  if 0 > col or col > nCols or 0 > row or row > nRows then
    return
  end
  -- calculate number of seats strictly- and left-behind
  return (nCols+1-col)*(nRows-row)
end

return kata
