package spinwords

// Reverses all words with 5 or more letters in the sentence.
fun spinWords(sentence: String) =
    Regex("""\p{Alpha}{5,}""").replace(sentence) { it.value.reversed() }
