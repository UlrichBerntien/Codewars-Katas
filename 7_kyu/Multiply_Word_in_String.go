package kata

import "strings"

// Repeats the loc word num times.
func ModifyMultiply(str string, loc, num int) string {
  if num <= 0 {
    // repeat the word at least one time
    num = 1
  }
  word := strings.SplitN(str," ",loc+2)[loc]
  words := strings.Repeat(word+"-",num)
  return words[:len(words)-1]
}
