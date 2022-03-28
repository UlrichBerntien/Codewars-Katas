// Count the digit d in the decimal representation of x.
fn count_digit(x: i32, d: i32) -> i32 {
    if x == d {
        // Special case cto overs x=0 and d=d.
        return 1;
    }
    let mut count = 0;
    let mut remain = x.abs();
    while remain > 0 {
        if remain % 10 == d {
            count += 1;
        }
        remain /= 10;
    }
    count
}

fn nb_dig(n: i32, d: i32) -> i32 {
    (0..=n).map(|x| count_digit(x * x, d)).sum()
}
