using System.Collections.Generic;
using System.Linq;

public class Kata
{
  // Returns list with number step, 2*step, 3*step, ... <= limit.
  public static List<int> FindMultiples(int step, int limit) =>
    Enumerable.Range(1,limit/step).Select( i => i*step ).ToList();
}
