package kata

import "math/bits"

func CountBits(value uint) int {
  return bits.OnesCount(value)
}
