#include <stdbool.h>

// Check if walk is a 10 step walk back to the start point.
// Steps are: n,s,e,w.
bool isValidWalk ( const char walk[] )
{
  // Count the steps
  unsigned count_s = 0;
  unsigned count_n = 0;
  unsigned count_e = 0;
  unsigned count_w = 0;
  for( const char* ptr = walk; *ptr; ++ptr )
    switch(*ptr)
    {
      case 's' : ++count_s; break;
      case 'n' : ++count_n; break;
      case 'e' : ++count_e; break;
      case 'w' : ++count_w; break;
      default  : return false; // Exit if invalid input
    }
  // Check: Endpinmt == Startpoint and number of steps == 10
  return count_n == count_s && count_e == count_w && count_n+count_s+count_e+count_w == 10;
}
