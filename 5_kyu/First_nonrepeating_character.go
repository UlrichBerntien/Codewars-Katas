package kata

import "strings"

func FirstNonRepeating(str string) string {
    // string comper should be case-insensetive
    upperStr := strings.ToUpper(str)
    // first: count the number of occurencies
    // use a map because an array of rune is too large.
    count := make( map[rune]int )
    for _,c := range upperStr {
        count[c]++
    }
    // second: get the first rune only 1 time in the (upper case) string
    for i,c := range upperStr {
        if count[c] == 1 {
            // return the original rune, not the upper case rune
            return str[i:i+1]
        }
    }
  // no rune found only one time in the (upper case) string
	return ""
}