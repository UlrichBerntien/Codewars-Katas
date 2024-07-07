#include <stdio.h>
#include <errno.h>
#include <stdlib.h>

/*
 *  Finds maximum and minmum.
 *  Reads and writes decimal numbers in strings.
 *  Is limited to the "long" number range.
 *  Arguments:
 *    strnum = A list of decimal numbers separated by spaces.
 *    result = buffer to hold the result, max and min as decimal numbers separated by spaces.  
 */
void high_and_low (const char *strnum, char *result)
{
  // Exit on NULL or empty string
  if (strnum == NULL || result == NULL)
    return;
  // walk with now and next in the input string strnum.
  const char* now = strnum;
  char* next;
  // min and max of the already seen values.
  long min, max;
  // current value
  long x;
  // Parse the input string number by number
  errno = 0;
  max = min = x = strtol(now, &next, 10);
  while (errno == 0 && now < next) {
    if (x > max) max = x;
    else if (x < min) min = x;
    x = strtol(now = next, &next, 10);
  }
  // Return the result
	sprintf(result, "%ld %ld", max, min);
}
