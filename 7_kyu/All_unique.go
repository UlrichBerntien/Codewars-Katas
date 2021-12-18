package kata

func HasUniqueChar (str string) bool {
    table := make(map[rune]bool, 128)
    for _, r := range str {
        if table[r] { return false }
        table[r] = true
    }
    return true
}