using System;

public static class Kata
{
  // Returns the nearest square number.
  // Means a number that is a square of an integer and has minimal difference to the parameter n.
  public static int NearestSq(int n) => (int) Math.Pow(Math.Round(Math.Sqrt(n)),2);
}
