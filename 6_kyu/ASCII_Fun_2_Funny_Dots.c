#define __STDC_WANT_LIB_EXT2__ 1
#include <assert.h>
#include <stdlib.h>
#include <string.h>

// Generates dot pattern ASCII art string.
// Caller must free the returned string.
char *dot (const unsigned width, const unsigned height)
{
  if( width < 1 || height < 1 )
    return strdup("");
  // Base patterns of the ASCII art.
  const char base10[] = "+---";
  const char base11[] = "+\n";
  const char base20[] = "| o ";
  const char base21[] = "|\n";
  // Size of the string
  const size_t row_size = width * strlen(base10) + strlen(base11);
  assert( strlen(base10) == strlen(base20) && strlen(base11) == strlen(base21) );
  const size_t row_count = height * 2 + 1;
  char *const buffer = malloc( row_size * row_count );
  // Generate first 2 rows
  char* ptr = buffer;
  for( unsigned i = 0; i < width; ++i )
    ptr = strcpy(ptr, base10) + strlen(base10);
  ptr = strcpy(ptr, base11) + strlen(base11);
  for( unsigned i = 0; i < width; ++i )
    ptr = strcpy(ptr, base20) + strlen(base20);
  ptr = strcpy(ptr, base21) + strlen(base21);
  // Copy the first 2 rows
  for( unsigned i = 1; i < height; ++i )
    ptr = strncpy(ptr, buffer, row_size*2) + row_size*2;
  // Close the grid
  ptr = strncpy(ptr, buffer, row_size) + row_size;
  // Terminate the string: replace last \n by a \0
  ptr[-1] = '\0';
  assert( ptr == buffer + row_size*row_count );
  return buffer;
}
