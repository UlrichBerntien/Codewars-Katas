package kata
import "unicode"

// Uses runes, not the bytes in a strings. So unicode is supported.

func AbbrevName(name string) string {
    names := []rune(name)
    i := 1
    for ; i < len(names) && !unicode.IsSpace(names[i]); i++ {}
    for ; i < len(names) && unicode.IsSpace(names[i]); i++ {}
    return string( []rune { unicode.ToUpper(names[0]), '.', unicode.ToUpper(names[i]) } )
}