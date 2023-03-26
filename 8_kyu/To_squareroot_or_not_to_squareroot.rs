// Returns square root y of x if an integer with y² = x exists.
// Returns None if there is no integer suqare root.
fn root(x: u32) -> Option<u32> {
    let y = (x as f64).sqrt();
    if y.fract() > 1e-10 {
        return None;
    }
    let y = y as u32;
    assert!(y.pow(2) == x);
    Some(y)
}

// Returns a transformation of all items in arr.
// If the item is a square of an integer the root is returned, else the square is returned.
fn square_or_square_root(arr: &[u32]) -> Vec<u32> {
    arr.iter().map(|&x| root(x).unwrap_or(x.pow(2))).collect()
}
