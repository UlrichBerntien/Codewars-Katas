// Finds nearst number of kind x², x∈ℕ.
fn nearest_sq(n: u32) -> u32 {
    (n as f64).sqrt().round().powi(2) as u32
}
