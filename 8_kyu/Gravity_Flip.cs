using System;

public class Kata
{
    // Sorts array arr, ascending or descending if dir is 'L'.
    public static int[] Flip(char dir, int[] arr)
    {
        Array.Sort(arr);
        if( dir == 'L' ) Array.Reverse(arr);
        return arr;
    }
}