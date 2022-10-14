#include <stdbool.h>

// Checks sort order of the array.
// Return order as string.
// Returns pointer to a string constant. Do not free it.
const char* isSortedAndHow (const int array[], const int arrayLength)
{
  bool lt = false, gt = false, eq = false;
  for( int index = 0; index < arrayLength-1; ++index ) {
    const int delta = array[index] - array[index+1];
    if( delta < 0 )
      lt = true;
    else if( delta > 0 )
      gt = true;
    else
      eq = true;
  }
  if( !lt )
    return "yes, descending";
  if( !gt )
    return "yes, ascending";
	return "no";
}
