package kata
import "math"

func Heron(a, b, c int) (area float32) {
  fa, fb, fc := float64(a), float64(b), float64(c)
  fs := (fa+fb+fc)/2.0
  farea := math.Sqrt(fs*(fs-fa)*(fs-fb)*(fs-fc))
  return float32(farea)
}