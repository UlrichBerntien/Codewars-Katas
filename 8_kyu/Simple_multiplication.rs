// Returns 8*number is number is even, else returns 9*number.
fn simple_multiplication(number: u8) -> u8 {
    number * (8 + number % 2)
}