namespace CubeCheck {
  using System;
  public class CubeChecker
  {
    // Returns true if it is a cube with positive volume.
    public bool IsCube(double volume, double side) =>
         volume > 0
      && Math.Abs( volume - Math.Pow(side,3) ) < 1e-6;
  }
}
