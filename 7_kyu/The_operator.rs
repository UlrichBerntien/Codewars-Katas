// Evaluates an equation "a @ b @ c ..".
fn evaluate(equation: String) -> Option<i64> {
    let mut numbers = equation.split('@');
    let start: Option<i64> = read_int(numbers.next().unwrap_or(""));
    numbers.fold(start, |accu, it| at(accu, read_int(it)))
}

// Implementation of the @operator.
// Returns None if one argument is None or rhs is 0.
// The definition of @operator: a @ b = (a + b) + (a - b) + (a * b) + (a // b)
fn at(lhs: Option<i64>, rhs: Option<i64>) -> Option<i64> {
    if lhs.is_none() || rhs.is_none() {
        return None;
    }
    let lhs = lhs.unwrap();
    let rhs = rhs.unwrap();
    if rhs == 0 {
        None
    } else {
        Some(2 * lhs + lhs * rhs + lhs / rhs)
    }
}

// Parses decimal value.
// Ignores spaces around the decimal number.
// Returns None if string could not parsed (e.g. empty no decimal number).
fn read_int(s: &str) -> Option<i64> {
    s.trim().parse::<i64>().ok()
}
