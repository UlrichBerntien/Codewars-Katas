package kata
import "strings"
type MyString string

func (s MyString) IsUpperCase() bool {
    str := string(s)
    return str == strings.ToUpper(str)
}