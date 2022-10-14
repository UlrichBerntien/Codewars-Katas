struct coords {
  int row;
  int col;
};

// Error mark (not found or more than one found).
static const struct coords ERROR = {-1, -1};

// Returns the position of the 'x' in the array.
// Returns -1,-1 if not found or move than one found.
struct coords x_marks_the_spot (const int rows, const int cols, const char array[rows][cols])
{
  // Initialise as not found
  struct coords found = ERROR;
  for( int r = 0; r < rows; ++r ) {
    const char *const row = array[r];
    for( int c = 0; c < cols; ++c )
      if( row[c] == 'x' ) {
        if( found.row == -1 ) {
          // Found the first 'x'
          found.row = r;
          found.col = c;
        } else {
          // Found a second 'x'
          return ERROR;
        }
      }
  }
  // Returns the one 'x' found or the initialization value ERROR.
  return found;
}
