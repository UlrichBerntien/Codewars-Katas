package kata
import "strings"

func CorrectTail(body string, tail rune) bool {
    return strings.HasSuffix( body, string(tail) )
}
