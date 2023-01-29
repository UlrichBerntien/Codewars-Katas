#[inline(always)]
fn value2index(x: i8) -> usize {
    (x as u8) as usize
}

fn sum_pairs(ints: &[i8], s: i8) -> Option<(i8, i8)> {
    let ints_len = ints.len();
    let mut first_index: [usize; 256] = [ints_len; 256];
    for i in 0..ints_len {
        let value = ints[i];
        if first_index[value2index(value)] < ints_len {
            return Some((ints[first_index[value2index(value)]], value));
        }
        let search = s.checked_sub(value);
        if search != None {
            first_index[value2index(search.unwrap())] = i;
        }
    }
    None
}
