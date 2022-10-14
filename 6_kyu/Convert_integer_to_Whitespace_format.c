#include <stdbool.h>
#include <stdlib.h>
#include <string.h>

char *whitespace_number(int n)
{
  const bool neg = n < 0;
  if(neg) n = -n;
  // count and revese bits 
  int r = 0;
  int bits = 0;
  while( n > 0 ) {
    r = (r << 1) + (n & 1);
    n >>= 1;
    bits++;
  }
  // create number
  char *const output = malloc( 2 + bits );
  int i = 0;
  output[i++] = neg ? '\t' : ' ';
  while( bits-- > 0 ) {
    output[i++] = r & 1 ? '\t' : ' ';
    r >>= 1;
  }
  // terminate number
  output[i++] = '\n';
  // terminate string
  output[i] = 0;
  return output;
}
