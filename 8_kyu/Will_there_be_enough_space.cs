using System;

public static class Kata
{
  public static int Enough(int cap, int on, int wait) => Math.Max( 0, on+wait-cap );
}