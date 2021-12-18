public class Kata
{
  public static string Remove(string s) =>
    s.EndsWith('!') ? s.Substring(0,s.Length-1) : s;
}