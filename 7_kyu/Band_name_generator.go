package kata
import "strings"

func bandNameGenerator(word string) string {
    // func uses runes not bytes to support Unicode
    runes := []rune(word)
    if runes[0] == runes[len(runes)-1] {
        return strings.Title(word) + string(runes[1:])
    } else {
        return "The " + strings.Title(word)
    }
}