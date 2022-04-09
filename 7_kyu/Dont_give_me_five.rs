fn dont_give_me_five(start: isize, end: isize) -> isize {
    (start..=end).filter(no_digit_5).count() as isize
}

fn no_digit_5(x: &isize) -> bool {
    let mut remain = x.abs();
    while remain > 0 {
        if remain % 10 == 5 {
            return false;
        }
        remain /= 10;
    }
    true
}
