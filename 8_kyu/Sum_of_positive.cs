using System;
using System.Linq;

public class Kata
{
  // Sum of all positive numbers in arr.
  public static int PositiveSum(int[] arr) => arr.Where(x => x > 0).Sum();
}
