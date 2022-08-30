package kata

func LoveFunc(flower1, flower2 int) bool {
  return flower1 & 1 != flower2 & 1
}
