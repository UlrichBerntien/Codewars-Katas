package kata
import "unicode"

// - Without creating a temporary array of string via strings.Split
//   needs no additional memory allocation.
// - By compare the runes in the string and not the bytes it works
//   also with all multi-byte unicode charachters.

func FindShort(s string) int {
    min := len(s)
    start := -1
    for i,v := range s {
        if unicode.IsSpace(v) {
            if start >= 0 {
                len := i - start
                if len < min { min = len }
                start = -1
            }
        } else {
            if start < 0 { start = i }
        }
    }
    if start >= 0 {
        len := len(s) - start
        if len < min { min = len }
    }
    return min
}