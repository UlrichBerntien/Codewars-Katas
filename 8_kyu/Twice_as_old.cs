using System;

namespace Solution {
    public class TwiceAsOldSolution {
        // Сalculate how many years ago father was 2x as old as son.
        // Return years in the future also as positive number.
        public static int TwiceAsOld(int dadYears, int sonYears)
            => Math.Abs(dadYears - 2 * sonYears);
    }
}
