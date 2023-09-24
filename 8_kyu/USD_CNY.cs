public static class Kata
{
    // Converts value in USD into a string with CNY value.
    // usd - value in USD
    // Return - "x.xx Chinese Yuan"
    public static string Usdcny(int usd) => $"{usd*6.75:F2} Chinese Yuan";
}
