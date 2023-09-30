using System.Linq;

public class Kata {
  // Returns array [a,a+1,a+2,...,b].
  public static int[] Between(int a, int b)  => Enumerable.Range(a,b+1-a).ToArray();
}
