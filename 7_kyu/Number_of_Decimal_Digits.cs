using System;

public class DecTools {
  // Returns number of decimal digits of n.
  public static int Digits(ulong n) {
    if(n==0) return 1;
    int count = 0;
    while(n > 0) {
      n /= 10;
      count++;
    }
    return count;
  }
}
