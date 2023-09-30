using System;

namespace Solution
{
  public class SolutionClass
  {
    static string[] name = new string[2] {"Even", "Odd"};
    public static string EvenOrOdd(int number) => name[number & 1];
  }
}