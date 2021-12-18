package kata

func RemoveChar(word string) string {
    lenWord := len(word)
    if lenWord <= 2 {
        return ""
    } else {
        return word[1: lenWord - 1]
    }
}