#include <stdlib.h>
#include <string.h>

// Return max of the two arguments.
static int max(const int a, const int b) {
  return a > b ? a : b;
}

// Add two decimal numbers a and b.
// Returns a string with the sum.
// Callers must free the returned string.
char *add(const char a[], const char b[]) {
  // Index of lowest decimal digit in the input numbers
  int index_a = strlen(a) - 1;
  int index_b = strlen(b) - 1;
  int index_accu = max(index_a, index_b);
  // accu length = Number  of minimal digits 
  // +1 for 0 string terminator
  // +1 for possible overflow 
  const int len_accu = index_accu + 3;
  char *const accu = malloc(len_accu);
  accu[index_accu+1] = 0;
  unsigned char carry = 0;
  while( index_a >= 0 || index_b >= 0 ) {
    unsigned char digit_a, digit_b;
    if( index_a >= 0 ) {
      digit_a = a[index_a--] - '0';
    } else {
      digit_a = 0;
    }
    if( index_b >= 0 ) {
      digit_b = b[index_b--] - '0';
    } else {
      digit_b = 0;
    }
    const unsigned sum = digit_a + digit_b + carry;
    accu[index_accu--] = sum % 10 + '0';
    carry = sum / 10;
  }
  if( carry > 0 ) {
    memmove( accu+1, accu, len_accu-1 );
    accu[0] = carry + '0';
  }
  return accu;
}
