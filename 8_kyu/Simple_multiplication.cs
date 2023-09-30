public class Multiplier
{
  public static int Multiply(int x) => x * 8 + (x & 1) * x;
}