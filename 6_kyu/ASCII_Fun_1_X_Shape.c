#include <wchar.h>

// Chars to build the cross. 
const wchar_t XCHAR = L'■';
const wchar_t OCHAR = L'□';
const wchar_t ECHAR = L'\n';
const wchar_t ZCHAR = L'\0';

// Fill with n times character c.
static inline wchar_t* wfill(wchar_t* dest, unsigned n, const wchar_t c)
{
  for( ; n != 0; --n )
    *dest++ = c;
  return dest;  
}

// Generate string filled with a cross.
// buffer must be preallocated and large enough.
wchar_t * x (const unsigned n, wchar_t buffer[n * (n + 1) + 1])
{
  // Chars per row
  const unsigned row_size = n+1;
  // Build X row by row from top and from bottom
  for( unsigned row = 0; row < n/2; ++row )
  {
    wchar_t *const row_a = buffer + row_size * row;
    wchar_t* ptr = wfill( row_a, row, OCHAR );
    ptr = wfill( ptr, 1, XCHAR );
    ptr = wfill( ptr, n-2*(row+1), OCHAR );
    ptr = wfill( ptr, 1, XCHAR );
    ptr = wfill( ptr, row, OCHAR );
    wfill( ptr, 1, ECHAR );
    wchar_t *const row_b = buffer + row_size * (n-1-row);
    wcsncpy(row_b, row_a, row_size);
  }
  // Special case, center row with one X.
  wchar_t* ptr = buffer + row_size * (n/2);
  ptr = wfill( ptr, n/2, OCHAR );
  ptr = wfill( ptr, 1, XCHAR );
  ptr = wfill( ptr, n/2, OCHAR );
  wfill( ptr, 1, ECHAR );
  // Terminate string
  buffer[row_size*n-1] = ZCHAR;
	return buffer;
}
