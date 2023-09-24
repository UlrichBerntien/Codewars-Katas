namespace Kata {
    public class TimeConvert {
        // Convert 12-hour time to 24 time string.
        public static string Convert12hTo24h(int hours, int minutes, string period) {
            period = period.ToLower();
            if (hours >= 12)
                hours = 0;
            if (period == "pm" || period == "p.m.")
                hours += 12;
            return $"{hours:D2}{minutes:D2}";
        }
    }
}
