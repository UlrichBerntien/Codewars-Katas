using System;

public static class Kata
{
  public static string Quote(string fighter)
  {
    return
      fighter.Equals("George Saint Pierre", StringComparison.OrdinalIgnoreCase)
      ? "I am not impressed by your performance."
      : "I'd like to take this chance to apologize.. To absolutely NOBODY!";
  }
}