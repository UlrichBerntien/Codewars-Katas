#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>

// Printf into new allocated buffer.
// Arguments:
//    format - format passed to a printf function
//    ... - arguments like a printf function
// Return:
//    String in new buffer. Caller must free the buffer.
//    NULL pointer on out of memory or NULL argument.
static char* print(const char format[], ...) {
  if (format == NULL)
    return NULL;
  int size = 64;
  char* buffer = NULL;
  while (buffer == NULL) {
    va_list args1;
    va_start(args1, format);
    va_list args2;
    va_copy(args2, args1);
    buffer = malloc(size);
    if (buffer == NULL)
      return NULL;
    const int needed = vsnprintf(buffer, size, format, args2);
    if (needed >= size) {
      free(buffer);
      buffer = NULL;
      size = needed + 1;
    }
    va_end(args1);
    va_end(args2);
  }
  return buffer;
}

// Returns funny like sentences as defined.
// Arguments:
//    n - Number of items in the array names.
//    names - Array of strings, the names to put into the sentence.
// Return:
//    Sentence in a string. The caller must free the string.
//    NULL on out of memory of NULL argument.
char* likes(const size_t n, const char *const names[n]) {
  switch (n) {
  case 0:
    return print("no one likes this");
  case 1:
    return print("%s likes this", names[0]);
  case 2:
    return print("%s and %s like this", names[0], names[1]);
  case 3:
    return print("%s, %s and %s like this", names[0], names[1], names[2]);
  default:
    /* 4 and more */
    return print("%s, %s and %d others like this", names[0], names[1], n - 2);
  }
}
