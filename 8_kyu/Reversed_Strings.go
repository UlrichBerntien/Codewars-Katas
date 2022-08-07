package kata

func Solution(word string) string {
    length := len(word)
    accu := make( []rune, length )
    for i,v := range word {
        accu[length-i-1] = v
  }
  return string(accu)
}