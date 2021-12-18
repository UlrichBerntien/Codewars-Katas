package kata

func Divide(weight int) bool {
    return weight > 2 && (weight-2) % 2 == 0
}
