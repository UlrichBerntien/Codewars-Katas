fn digit_product(x: u64) -> u64 {
    let mut product: u64 = 1;
    let mut remain = x;
    while remain > 0 {
        product *= remain % 10;
        remain /= 10;
    }
    product
}

fn persistence(num: u64) -> u64 {
    let mut counter: u64 = 0;
    let mut x = num;
    while x > 9 {
        x = digit_product(x);
        counter += 1;
    }
    counter
}
