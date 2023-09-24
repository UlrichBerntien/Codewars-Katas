using System.Linq;

public static class Kata {
    public static int TotalPoints(string[] games) =>
        games.Sum( g => g[0] <  g[2] ? 0 :
                        g[0] == g[2] ? 1 :
                        3 );

}
