package kata

import "math"

func FindUniq(arr []float32) float32 {
  count := make(map[float32]int)
  for _,value := range arr {
    count[value]++
  }
  for value, n := range count {
    if n == 1 {
      return value
    }
  }
  return float32(math.NaN())
}