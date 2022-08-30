// Filles array result with a,a+1,a+2,..,b.
void between(const int a, const int b, int result[] )
{
  for( int value = a, index = 0; value <= b; ++value, ++index )
    result[index] = value;
}