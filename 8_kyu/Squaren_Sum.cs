using System;
using System.Linq;

public static class Kata
{
  // Returns the sum of the squared items.
  public static int SquareSum(int[] numbers) => numbers.Sum(i => i*i);
}