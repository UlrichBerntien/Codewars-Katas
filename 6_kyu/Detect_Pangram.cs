public static class Kata {
    // Array of integers, value = 2**index
    private static readonly int[] bits = {
        1,
        2,
        4,
        8,
        16,
        32,
        64,
        128,
        256,
        512,
        1024,
        2048,
        4096,
        8192,
        16384,
        32768,
        65536,
        131072,
        262144,
        524288,
        1048576,
        2097152,
        4194304,
        8388608,
        16777216,
        33554432
    };

    // Returns True if str contains all letters a..z, is a pangram.
    public static bool IsPangram(string str) {
        if (str.Length < 26) return false;
        str = str.ToLower();
        int b = 0;
        foreach(char c in str) if ('a' <= c && c <= 'z') b |= bits[c - 'a'];
        return b == 67108863;
    }
}