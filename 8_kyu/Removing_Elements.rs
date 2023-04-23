// Returns every second item in the vector, arr[0,2,3,..].
fn remove_every_other(arr: &[u8]) -> Vec<u8> {
    let mut accu: Vec<u8> = Vec::with_capacity(1 + arr.len() / 2);
    accu.extend(arr.iter().step_by(2));
    accu
}
