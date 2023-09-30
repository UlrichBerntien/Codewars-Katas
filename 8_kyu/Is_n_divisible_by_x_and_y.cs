public class DivisibleNb 
{
  // Returns true if n is an integer multiple of x and y.
	public static bool IsDivisible(int n, int x, int y) => n%x == 0 && n%y == 0;
}
