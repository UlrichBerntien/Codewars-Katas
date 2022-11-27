#include <stddef.h>
#include <stdio.h>
#include <string.h>

// Code puzzle.
void one_two_three(const unsigned char n, char a[], char b[]) {
  // generate string a
  const int nines = n / 9;
  const int remain = n % 9;
  memset(a, '9', nines);
  a[nines] = 0;
  if( nines == 0 || remain > 0 )
    a[nines] = '0' + remain;
  a[nines+1] = 0;
  // generate string b
  if( n == 0 )
  {
    strcpy(b, "0");
  }
  else
  {
    memset(b, '1', n);
    b[n] = 0;
  }
}
