/// Return binary representation as i32.
pub fn convert_to_i32(f: f32) -> i32 {
    union Trafo {
        float: f32,
        int: i32,
    }
    return unsafe { Trafo{float: f}.int };
}
