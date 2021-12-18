package kata

import (
  "math"
  "strconv"
  "strings"
)

func HighAndLow(in string) string {
  minValue := math.MaxInt64
  maxValue := math.MinInt64
  for _,field := range strings.Fields(in) {
    value, err := strconv.Atoi(field)
    if err == nil {
      if value < minValue {
        minValue = value
      }
      if value > maxValue {
        maxValue = value
      }
    }
  }
  return strconv.Itoa(maxValue) + " " + strconv.Itoa(minValue)
}
