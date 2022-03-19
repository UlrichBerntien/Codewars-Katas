#[inline]
fn clamp_to_u8(x: i32) -> u8 {
    x.clamp(0,255) as u8
}

fn rgb(r: i32, g: i32, b: i32) -> String {
    format!("{:02X}{:02X}{:02X}",clamp_to_u8(r),clamp_to_u8(g),clamp_to_u8(b))
}
