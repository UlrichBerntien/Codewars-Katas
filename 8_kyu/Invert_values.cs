using System.Linq;
namespace Solution
{
  public static class ArraysInversion
  {
    // Returns copy of the array input with all items negated.
    public static int[] InvertValues(int[] input) => input.Select(x=>-x).ToArray();
  }
}