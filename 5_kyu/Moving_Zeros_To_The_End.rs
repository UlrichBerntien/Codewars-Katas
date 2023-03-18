// Returns a copy of arr with all zeros moved to the end.
fn move_zeros(arr: &[u8]) -> Vec<u8> {
    let mut accu: Vec<u8> = Vec::with_capacity(arr.len());
    accu.extend(arr.iter().filter(|&&x| x != 0));
    accu.resize(arr.len(), 0);
    accu
}
