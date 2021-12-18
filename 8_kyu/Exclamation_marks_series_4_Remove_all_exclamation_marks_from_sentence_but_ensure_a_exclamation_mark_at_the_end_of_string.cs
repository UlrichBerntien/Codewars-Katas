using System.Text;

public class Kata
{
  public static string Remove(string s)
  {
    return new StringBuilder(s)
      .Replace("!", string.Empty)
      .Append("!")
      .ToString();
  }
}
