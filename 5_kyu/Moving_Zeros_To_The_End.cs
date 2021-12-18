public class Kata
{
  public static int[] MoveZeroes(int[] arr)
  {
      int[] result = new int[arr.Length];
      int dst = 0;
      foreach (int val in arr)
          if (val != 0)
            result[dst++] = val;
      return result;
  }
}