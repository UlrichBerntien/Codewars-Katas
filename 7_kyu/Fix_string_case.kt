object FixStringCase {

    /**
     * Converts string to uppercase or lowercase.
     *
     * @param s Converts this string.
     * @param String s uppercase if most chars in s are uppercase else s in lowercase.
     */
    fun solve(s: String): String {
        val u = s.uppercase()
        val changes = s.zip(u).count { it.first != it.second }
        return if (2 * changes < s.length) u else s.lowercase()
    }
}
