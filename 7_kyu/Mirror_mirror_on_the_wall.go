package kata

import "sort"

func Mirror(data []int) []int {
  result := make([]int, len(data), len(data)*2)
  copy(result, data)
  sort.Ints(result)
  for index:=len(data)-2; index >= 0; index-- {
    result = append(result, result[index])
  }
  return result
}