using System;
using System.Numerics;

public class Kata {
  // Returns the powers of 2 inside n.
  public static int[] Powers(int n) {
      int m = BitOperations.PopCount((uint) n);
      int[] r = new int[m];
      for( int i = 0, v = 1; i < m; v<<=1 )
        if( (n & v) != 0 )
          r[i++] = v;
      return r;
  }
}
