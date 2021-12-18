package kata

import "math/bits"

func Testit(n uint32) int {
  return bits.OnesCount32(n)
}