fn multiples(m: i32, n: f64) -> Vec<f64> {
    if m < 0 {
        panic!("invalid array size {}", m);
    }
    let mut result = Vec::<f64>::with_capacity(m as usize);
    // The array must be initaliszed with n*it.
    // Sum up n+n+n... gives not the correct values due to floating point rounding errors.
    for it in 1..=m {
        result.push( n * it as f64 )        
    }
    result
}
