package kata
import "strings"

func IsPalindrome(str string) bool {
    upper := []rune( strings.ToUpper(str) )
    length := len(upper)
    palindrome := true
    for i:=0; i*2 < length && palindrome; i++ {
        palindrome = upper[i] == upper[length-1-i]
    }
    return palindrome
}