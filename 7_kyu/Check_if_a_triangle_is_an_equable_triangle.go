package kata
import "math"

func EquableTriangle(a, b, c int) bool {
    // func uses float arithmetic to prevent integer overflows
    fa, fb, fc := float64(a), float64(b), float64(c)
    // half perimeter
    s := ( fa + fb + fc )/2
    // sqrt(s*f) will be the area, but not needed to calculate
    f := (s-fa)*(s-fb)*(s-fc)
    return math.Abs(4*s-f) < 0.001*(4*s+f)
}