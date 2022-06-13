package kata

func NextLower(n int32) int32 {
  if n > 0 {
		v := uint32(n)
		r := uint32(1)
		for v > r<<1 {
			r <<= 1
		}
		return int32(r)
	} else {
		v := uint32(-n)
		r := uint32(1)
		for v >= r {
			r <<= 1
		}
		return -int32(r)
	}
}
