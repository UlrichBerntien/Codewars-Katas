#include <stdarg.h>

// Counts number of arguments.
// All arguments will have type const char *.
// Last argument will be NULL and included in the count.
unsigned args_count (const char *arg1, ...)
{
  if( arg1 == 0 )
    return 0;
  unsigned counter = 1;
  va_list varg;
  va_start(varg, arg1);
  while( va_arg(varg,const void*) )
    ++counter;
  va_end(varg);
	return counter;
}
