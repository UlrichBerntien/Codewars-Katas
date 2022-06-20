package kata

import "strings" 

func ReplaceDots(str string) string {
  return strings.Replace(str, ".", "-", -1)
}

