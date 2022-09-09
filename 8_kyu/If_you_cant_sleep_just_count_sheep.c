#define __STDC_WANT_LIB_EXT2__ 1

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Generate string "1 sheep...2 sheep..." up to n.
// Caller must free the returned strings.
char* count_sheep(const int n) {
  // Check argument range
  if( n < 1 )
    return strdup("");
  // Estimate maximal needed memory
  const char format[] = "%d sheep...";
  const size_t item_size_max = 10 + sizeof format;
  const size_t size = item_size_max * n;
  // Allocate buffer to hold the string and typical some bytes more
  char *const buffer = malloc(size);
  size_t index = 0;
  // Generate the string
  for( int i = 1; i <= n; ++i )
    index += snprintf(buffer+index, size-index, format, i);
  return buffer;
}
