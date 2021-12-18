package kata

// True if and only if str is in arr.
func contains(str string, arr []string) bool {
  for _,s := range arr {
    if str == s {
      return true
    }
  }
  return false  
}

func ContainAllRots(strng string, arr []string) bool { 
  runes := []rune(strng)
  for first:=0; first < len(runes); first++ {
    rotated := string(runes[first:]) + string(runes[:first])
    if ! contains(rotated, arr) {
      return false
    }
  }
  return true
}