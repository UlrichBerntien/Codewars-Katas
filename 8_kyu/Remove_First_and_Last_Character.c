#include <string.h>

// Copy src to dst without first and last character.
// Buffer dst size must be at least strlen(src)-1.
// Returns dst. 
char* remove_char(char *const dst, const char *const src)
{
  if( dst == NULL )
    return NULL;
  if( src == NULL || *src == 0 )
    return strcpy(dst, "");
  const size_t l = strlen(src+1);
  strncpy(dst, src+1, l);
  dst[l > 1 ? (l-1) : 0] = 0;
  return dst;
}
