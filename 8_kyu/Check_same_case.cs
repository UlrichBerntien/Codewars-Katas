using System;

public class Kata {
    // Check if two letters have same case
    // Return 1 on same case, 0 on different case, -1 on no letter.
    public static int SameCase(char a, char b) {
        if (!Char.IsLetter(a) || !Char.IsLetter(b))
            return -1;
        if (Char.IsLower(a) == Char.IsLower(b))
            return 1;
        else
            return 0;
    }
}