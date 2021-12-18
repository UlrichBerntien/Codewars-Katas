package kata

func EvenOrOdd(number int) string {
    if number & 1 == 0 {
        return "Even"
    } else {
        return "Odd"
    }
}