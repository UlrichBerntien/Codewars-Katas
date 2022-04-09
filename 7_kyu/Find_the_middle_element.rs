fn gimme(input_array: [i32; 3]) -> usize {
    let ab = input_array[0] < input_array[1];
    let ac = input_array[0] < input_array[2];
    let bc = input_array[1] < input_array[2];
    [1, 2, 1, 0, 0, 1, 2, 1][b2b(ab, ac, bc)]
}

#[inline(always)]
fn b2b(a: bool, b: bool, c: bool) -> usize {
    (if a { 4 } else { 0 }) + (if b { 2 } else { 0 }) + (if c { 1 } else { 0 })
}
