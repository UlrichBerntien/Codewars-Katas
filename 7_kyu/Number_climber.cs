using System;

public class Kata {
    // Returns ascending number sequence up to n.
    // Each x[i+1] = 2*x[i] or 2*x[i]+1.
    public static int[] Climb(int n) {
        if (n < 1) throw new ArgumentOutOfRangeException("n < 1");
        int i = 1 + (int) Math.Log2(n);
        int[] accu = new int[i];
        while (n > 0) {
            accu[--i] = n;
            n /= 2;
        };
        return accu;
    }
}