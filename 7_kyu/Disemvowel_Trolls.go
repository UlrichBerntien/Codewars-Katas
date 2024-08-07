package kata
import "regexp"

// Matches all vowels
var vowels = regexp.MustCompile("[aeiouAEIOU]+")

// Returns argument str without all vowels characters.
func Disemvowel(str string) string {
  return vowels.ReplaceAllString(str,"")
}
