package kata
import "math"

func EquableTriangle(a, b, c int) bool {
    fa, fb, fc := float64(a),float64(b),float64(c)
    s := (fa+fb+fc)/2
    f := (s-fa)*(s-fb)*(s-fc)
    return math.Abs(4*s-f) < 0.001*(4*s+f)
}