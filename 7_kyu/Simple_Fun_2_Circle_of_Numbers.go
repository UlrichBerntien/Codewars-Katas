package kata

func CircleOfNumbers(n int, firstNumber int) int {
    return (firstNumber + n/2) % n
}