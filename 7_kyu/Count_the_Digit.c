#include <stdlib.h>

// Returns count id digit d in the decimal number nr.
static int count_digit(const int nr, const int d)
{
  if( nr == 0 )
    return d == 0 ? 1 : 0;
  int counter = 0;
  int n = abs(nr);
  while( n > 0 )
  {
    if( d == n % 10 )
      ++counter;
    n /= 10;
  }
  return counter;
}

// Returns count of digit d in the nuzmber 0², 1², .. n². 
int nbDig(const int n, const int d)
{
  int counter = 0;
  for( int i = 0; i <= n; ++i )
    counter += count_digit(i*i, d);
  return counter;
}
