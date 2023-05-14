// Returns all number up to (2^n)-1 with bit b == 1.
// Supports up to n=31.
fn solution(n: u8, b: u32) -> Vec<u32> {
    let mut accu: Vec<u32> = Vec::new();
    if n == 0 || n > 31 || b == 0 {
        return accu;
    }
    let limit: u32 = 2u32.pow(n as u32);
    let mut i = b;
    while i < limit {
        accu.push(i);
        i = (i + 1) | b;
    }
    accu
}
