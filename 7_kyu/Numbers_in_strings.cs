using System;
using System.Linq;
using System.Text.RegularExpressions;

public static class Kata
{
  // Regular expression matches a decimal number.
  private static Regex decimal_number = new Regex( @"\d+" );
  
  // Return max of all decimal numbers found in the string s.
  public static int Solve(string s) => decimal_number.Matches(s).Max( match => int.Parse(match.Value) );
}
