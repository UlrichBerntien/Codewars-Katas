fun addLetters(arr: List<Char>): Char {
    val letterSum = arr.asIterable().map{ it - 'a' + 1 }.sum()
    return 'a' + ((letterSum+25) % 26)
}