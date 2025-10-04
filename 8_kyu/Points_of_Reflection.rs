// Calculates the symmetric point from p relative to q.
// It is: p - q = q - return point
fn symmetric_point(p: [i32; 2], q: [i32; 2]) -> [i32; 2] {
    // return = 2q - p
    [2 * q[0] - p[0], 2 * q[1] - p[1]]
}
