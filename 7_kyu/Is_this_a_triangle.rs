// Returns true if sides a,b,c defines an triangle with surface > 0.
// a,b,c are the length of the triangle sides.
fn is_triangle(a: i64, b: i64, c: i64) -> bool {
    let mut sides: [i64; 3] = [a, b, c];
    sides.sort_unstable();
    // Uses substraction to avoid overflow in the check "sum of short sides > long side".
    sides[0] > 0 && sides[0] > sides[2] - sides[1]
}
