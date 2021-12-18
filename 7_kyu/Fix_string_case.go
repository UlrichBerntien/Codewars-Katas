package kata

import (
    "strings"
    "unicode"
)

func solve(str string) string {
    countLower := 0
    for _,v := range str {
        if unicode.IsLower(v) { countLower++ }
    }
    if countLower < len(str)-countLower {
        return strings.ToUpper(str)
    } else {
        return strings.ToLower(str)
    }  
}