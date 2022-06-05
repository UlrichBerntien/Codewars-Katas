fun addLetters(arr: List<Char>): Char {
    val letterSum = arr.sumBy { it - 'a' + 1 }
    return 'a' + ((letterSum+25) % 26)
}