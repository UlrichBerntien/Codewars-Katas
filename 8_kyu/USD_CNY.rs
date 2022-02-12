fn usdcny(usd: u16) -> String {
    format!( "{:.2} Chinese Yuan", usd as f64 * 6.75 )
}