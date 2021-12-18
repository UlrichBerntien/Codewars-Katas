public class Kata
{
  public static int CloseCompare(double a, double b, double margin = 0)
  {
    double delta = a - b;
    if (delta < -margin)
      return -1;
    else if (delta > margin)
      return +1;
    else
      return 0;
  }
}