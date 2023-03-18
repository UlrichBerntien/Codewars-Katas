// Evalues "value1 operator value2".
// Supports +, -, * and / operator.
fn basic_op(operator: char, value1: i32, value2: i32) -> i32 {
    match operator {
        '+' => value1 + value2,
        '-' => value1 - value2,
        '*' => value1 * value2,
        '/' => value1 / value2,
        _ => panic!("undefined operator character"),
    }
}
