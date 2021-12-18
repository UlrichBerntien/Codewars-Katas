package kata
import "math"

func StackHeight2d(layers int) float64 {
    if layers < 1 {
        return 0.0
    } else {
        // The centers of 3 balls are the edge points
        // of a triangle with edge length D.
        // The high of the triangle is D*sqrt(3/4).
        return 1 + float64(layers-1)*math.Sqrt(3.0/4.0)
    }
}