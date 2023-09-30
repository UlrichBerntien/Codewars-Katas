using System;
using System.Linq;

public static class StringExtensions
{
  // Checks if string is uppercase.
  // Returns true if all letters in the string are in upper case.
  public static bool IsUpperCase(this string text) => text.All( c => Char.IsUpper(c) || !Char.IsLetter(c) );
}
