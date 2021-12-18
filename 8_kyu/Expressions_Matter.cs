using System.Linq;
using System.Collections.Generic;

public class Kata
{
    public static int ExpressionsMatter(int a, int b, int c)
    {
      IEnumerable<int> allOptions () {
          yield return a+b+c;
          yield return a+b*c;
          yield return (a+b)*c;
          yield return a*b+c;
          yield return a*(b+c);
          yield return a*b*c;
      };
      return allOptions().Max();
    }
}