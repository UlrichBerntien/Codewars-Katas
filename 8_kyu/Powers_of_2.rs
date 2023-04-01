// Returns vector 2^0, 2^1, .. 2^n.
fn powers_of_two(n: u8) -> Vec<u128> {
    let l = n as usize + 1;
    let mut accu: Vec<u128> = Vec::with_capacity(l);
    let mut x: u128 = 1u128.rotate_right(1);
    accu.resize_with(l, || {
        x = x.rotate_left(1);
        x
    });
    accu
}
