using System.Text.RegularExpressions;

public class Kata
{
  // Matches an alphanumeric string with at least one character.
  private static Regex anum = new Regex(@"^[0-9A-Za-z]+$");
  
  // Returns true if str is a alphanumeric string with at least one character.
  public static bool Alphanumeric(string str) => anum.IsMatch(str);
}
