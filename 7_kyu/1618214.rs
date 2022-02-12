fn add(num1: u32, num2: u32) -> u64 {
    let mut num1 = num1;
    let mut num2 = num2;
    let mut sum = 0u64;
    let mut shift = 1u64;
    while num1 > 0 ||  num2 > 0 {
        let last_sum = num1 % 10 + num2 % 10;
        sum += last_sum as u64 * shift;
        shift *= if last_sum > 9 {100} else {10};
        num1 /= 10;
        num2 /= 10;
    }
    sum
}