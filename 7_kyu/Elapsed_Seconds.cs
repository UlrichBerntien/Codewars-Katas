using System;

public class Kata
{
  // Returns total number of seconds between startDate and endDate.
  public static int ElapsedSeconds(DateTime startDate, DateTime endDate) => (int) (endDate-startDate).TotalSeconds;
}