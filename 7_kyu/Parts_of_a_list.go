package kata

import "strings"

func PartList(arr []string) string {
    countM1 := len(arr) - 1
    var result strings.Builder
    for it := 0; it < countM1; it++ {
        result.WriteRune('(')
        for bit, str := range arr {
            result.WriteString(str)  
            switch {
                case bit == it : result.WriteString(", ")
                case bit < countM1 : result.WriteRune(' ')              
            }
        }
        result.WriteRune(')')
    }
    return result.String()
}
