using System;
using System.Linq;

public static class Kata
{
    // Generates multiplication table 1,2,..,10 times the number n.
    public static string MultiTable(int n) =>
        String.Join( "\n", Enumerable.Range(1,10).Select( i => $"{i} * {n} = {i*n}") );
}
