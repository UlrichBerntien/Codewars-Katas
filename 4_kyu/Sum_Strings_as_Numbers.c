#include <malloc.h>
#include <string.h>

// Swaps the addressed items.
static void swap_t( size_t *const a, size_t *const b ) {
  size_t t = *a;
  *a = *b;
  *b = t;
}

// Swaps the addressed items.
static void swap_p( const char* *const a, const char* *const b ) {
  const char* t = *a;
  *a = *b;
  *b = t;
}

// Adds decimal numbers in strings.
// Arguments:
//    a,b - String with decimal numbers to add.
// Return:
//    The sum a decimal number in a string.
// The caller must free the returned string.
char* strsum(const char *a, const char *b)
{
  // Number of digits.
  size_t la = strlen(a);
  size_t lb = strlen(b);
  if( lb > la ) {
    swap_t( &la, &lb );
    swap_p( &a, &b );
  }
  // Now: number b is always the shorter one.
  // Result at most one digit longer than the longest summand.
  const size_t ls = la + 1;
  char *const result = malloc(ls+1);
  result[ls] = 0;
  // last non zero digit.
  size_t last_nz = 1;
  // Add the digits.
  int carry = 0;
  for( size_t i = 1; i <= lb; ++i ) {
    char s = a[la-i] + b[lb-i] + carry - '0';
    carry = s > '9' ? 1 : 0;
    if( carry )
      s -= 10;
    if( s != '0' )
      last_nz = i;
    result[ls-i] = s;
  }
  // Higher digits of a could be changed by carry.
  for( size_t i = lb+1; i <= la; ++i ) {
    char s = a[la-i] + carry;
    carry = s > '9' ? 1 : 0;
    if( carry )
      s -= 10;
    if( s != '0' )
      last_nz = i;
    result[ls-i] = s;
  }
  if( carry )
    result[0] = '1';
  else
    // cut the leading zeros
    memmove(result, result+ls-last_nz, last_nz+1);
  return result;
}
