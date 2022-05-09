fn bin_to_decimal(inp: &str) -> i32 {
    i32::from_str_radix(inp,2).expect("bin parse error")
}
