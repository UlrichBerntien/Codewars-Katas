using System;

public static class Kata {
  // Area of the circle with given radius.
  // Throws ArgumentException in radius <= 0.
  public static double CalculateAreaOfCircle(double radius) {
    if (radius <= 0)
      throw new ArgumentException("radius is not positive");
    return Math.PI * radius * radius;
  }
}