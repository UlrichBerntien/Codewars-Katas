using System;
using System.Linq;

public class Kata
{
  // Returns number as fake binary number, 
  public static string FakeBin(string x) => String.Concat( x.Select(c => c > '4' ? '1' : '0') );
}