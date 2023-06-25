# Returns the number of seats strictly+left behind
# n_cols = number of seat columns
# n_rows = number of seat rows
# col    = seat column position, 1..n_cols
# row    = seat row position, 1..n_rows
seats_in_theater <- function(n_cols, n_rows, col, row) (n_cols+1-col) * (n_rows-row)
