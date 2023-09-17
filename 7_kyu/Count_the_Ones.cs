using System.Numerics;

public class Kata
{
  // Returns number of bits set in x.
  public static int HammingWeight(int x) => BitOperations.PopCount((uint) x);
}