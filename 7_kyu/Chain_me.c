#include <stddef.h>

typedef int (*funcptr) (int);

// Calls function chain.
// Returns value of last function call.
int chain (const int init_val, const size_t length, const funcptr f[length])
{
  int val = init_val;
  for( size_t i = 0; i < length; ++i )
    val = f[i](val);
  return val;
}
