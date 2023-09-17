using System.Linq;

public static class Kata
{
  // Returns array {n, n-1, ... 0}.
  public static int[] ReverseSeq(int n) => Enumerable.Range(1,n).Reverse().ToArray();
}
