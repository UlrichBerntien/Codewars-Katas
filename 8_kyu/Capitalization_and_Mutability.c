#include <ctype.h>

#define __STDC_WANT_LIB_EXT2__ 1
#include <string.h>

// Capitalize the word.
// Changed the first letter to upper case.
// The caller must free the returned memory.
char* capitalize_word (const char *const word)
{
  char *const result = strdup(word ? word : "");
  *result = toupper(*result);
  return result;
}
