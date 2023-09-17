using System.Linq;

public static class Kata
{
  // Returns width of the numbers in the array.
  public static int SumOfDifferences(int[] arr) => arr.Length < 2 ? 0 : arr.Max() - arr.Min();
}
