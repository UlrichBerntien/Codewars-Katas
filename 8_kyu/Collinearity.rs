/// Returns true if vector (x1,y1) is parallel to vector (x2,y2).
fn collinearity(x1: i32, y1: i32, x2: i32, y2: i32) -> bool {
    x1 as i64 * y2 as i64 == x2 as i64 * y1 as i64
}