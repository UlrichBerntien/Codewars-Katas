using System;
using System.Collections.Generic;
using System.Linq;

public static class Kata {
  // Filter passes all elements which are 
  public static List <int> MultipleOfIndex(List < int > xs) =>
    xs.Where((x, i) => x == i || (i > 0 && x % i == 0))
      .ToList();
}