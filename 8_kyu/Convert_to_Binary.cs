using System;

public static class Kata
{
  // Converts num into a number printed as decimal looks like the binary format of num.
  public static int ToBinary(int n)
  {
    int accu = 0;
    int bit = 1;
    while( n > 0 ) {
      if( (n & 1) > 0 ) accu += bit;
      bit *= 10;
      n >>= 1;
    }
    return accu;
  }
}
