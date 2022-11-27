#include <stdlib.h>
#include <stdio.h>

// Adds two integers stored and returned as decimal numbers in strings.
// Restricion: int number range for arguments and sum.
// Parameters:
//    sum - buffer, big enough to hold the sum
//    a, b - the decimal numbers to add.
// Return:
//    the sum buffer.
char *sum_strings (char sum[], const char a[], const char b[])
{
  sprintf( sum, "%d", atoi(a)+atoi(b) );
	return sum;
}
