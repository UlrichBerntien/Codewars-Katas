// Sum of the natural numbers upto n.
// Sum of 1,2,3,...,n
fn gauss(n: i32) -> i32 {
    if n < 1 {
        0
    } else {
        (n * (n + 1)) / 2
    }
}

fn solution(num: i32) -> i32 {
    let last = num - 1;
    let s3 = 3 * gauss(last / 3);
    let s5 = 5 * gauss(last / 5);
    let s15 = 15 * gauss(last / 15);
    s3 + s5 - s15
}
