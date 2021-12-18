public class Kata
{
  public static string WhoseMove(string lastPlayer, bool win)
    => "white" == lastPlayer == win ? "white" : "black";
}