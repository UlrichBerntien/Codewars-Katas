
// Minimum of all items in the array.
// Arguments:
//    array - Array of integers to check.
//    sizue - Number of integers in array.
// Return:
//    The minimal value in the array.
//    0 if array is empty.
int min(const int array[], const int size)
{
  if( array == 0 || size < 1 )
    return 0;
  int accu = array[0];
  for( int i = 1; i < size; ++i )
    if( array[i] < accu )
      accu = array[i];
  return accu;
}


// Maximum of all items in the array.
// Arguments:
//    array - Array of integers to check.
//    sizue - Number of integers in array.
// Return:
//    The maximal value in the array.
//    0 if array is empty.
int max(const int array[], const int size)
{
  if( array == 0 || size < 1 )
    return 0;
  int accu = array[0];
  for( int i = 1; i < size; ++i )
    if( array[i] > accu )
      accu = array[i];
  return accu;
}
