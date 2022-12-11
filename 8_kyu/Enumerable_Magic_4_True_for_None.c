#include <stdbool.h>
#include <stddef.h>

typedef bool (*Predicate)(int);

// Checks all items of arr with the fun.
// Arguments:
//    arr - Array if items to check.
//    size - Number if items in arr.
//    fun - function to check the items.
// Return:
//    True if and only if all checks returns false.
//    False if at least one check returns true.
bool none(const int arr[], const size_t size, const Predicate fun)
{
  if( arr == NULL || fun == NULL )
    return true;
  for( size_t i = 0; i < size; ++i )
    if( fun(arr[i]) )
      return false;
    return true;
}
