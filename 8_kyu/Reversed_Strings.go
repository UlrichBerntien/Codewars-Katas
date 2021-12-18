package kata
import "strings"

func Solution(word string) string {
  var accu strings.Builder
  for i := len(word)-1; i >= 0; i-- {
    accu.WriteByte( word[i] )
  }
  return accu.String()
}