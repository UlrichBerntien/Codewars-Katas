using System;

public class Kata
{
  public static double SquareArea(double A)
  {
      return Math.Round( Math.Pow( 2*A/Math.PI, 2 ), 2 );
  }
}