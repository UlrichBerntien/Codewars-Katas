fn find_difference(a: &[i32; 3], b: &[i32; 3]) -> i32 {
    ( a[0]*a[1]*a[2] - b[0]*b[1]*b[2] ).abs()
}