fn decimal_digits(n: usize) -> Vec<usize> {
    let mut result = Vec::<usize>::with_capacity(usize::BITS as usize / 3);
    let mut remain = n;
    while remain > 0 {
        result.push(remain % 10);
        remain /= 10;
    }
    result
}

fn faulty_odometer(n: usize) -> usize {
    let digits = decimal_digits(n);
    let mut accu = 0;
    for digit in digits.into_iter().rev() {
        // due to the fault the counter works with base 9, not base 10.
        accu = accu * 9 + digit;
        if digit >= 5 {
            accu -= 1;
        }
    }
    accu
}
