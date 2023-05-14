// Returns true if n is zero and negative.
fn is_negative_zero(n: f32) -> bool {
    n == 0. && n.is_sign_negative()
}
