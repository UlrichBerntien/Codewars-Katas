using System;
using System.Linq;

public static class Kata
{
    public static int ElevatorDistance(int[] array) => Enumerable.Range(1,array.Length-1).Sum( i => Math.Abs(array[i]-array[i-1]) );
}
