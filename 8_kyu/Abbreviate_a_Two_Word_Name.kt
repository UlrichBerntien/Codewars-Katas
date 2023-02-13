/**
 * Abbreviate two the first two words.
 *
 * @param name String containing at least two space separated words
 * @return "first.second" The first letter of the first two words in upper case.
 */
fun abbrevName(name: String) =
    Regex("""\s*(.)\S*\s+(.).*""").replace(name, """$1.$2""").uppercase()
