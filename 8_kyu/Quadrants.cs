using System;

public static class Kata
{
  // Quadrant 1-4 of the point (x,y) in the plane.
  public static int Quadrant(int x, int y) => x>=0 ? (y>=0?1:4) : (y>0?2:3);
}
