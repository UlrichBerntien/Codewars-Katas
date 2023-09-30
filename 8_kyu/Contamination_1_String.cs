public class Kata
{
  // Returns string of frist 8-bit char of character string and length of text string.
  public static string Contamination(string text, string character) =>
      character.Length > 0
      ? new string(character[0], text.Length)
      : "";
}
