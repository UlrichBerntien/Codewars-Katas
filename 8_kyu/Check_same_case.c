#include <ctype.h>

int same_case (const char a, const char b)
{
  if( isalpha(a) && isalpha(b) )
    return isupper(a) == isupper(b);
  else
    return -1;
}