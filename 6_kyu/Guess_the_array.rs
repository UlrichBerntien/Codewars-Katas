// Solves the "Guess the array" challenge.
// n - Size of the array.
// f(i,j) - Function returning the sum of element at index i and j.
//          Limitation: i != j and maximal distance 2.
fn guess<F>(f: F, n: usize) -> Vec<i32>
where
    F: Fn(usize, usize) -> i32,
{
    if n < 3 {
        // Out of range of the challenge
        panic!();
    }
    let mut result = Vec::<i32>::with_capacity(n);
    // Calculate the values of the first 3 elements of the array
    // With the first elements a,b,c it is
    // Get the values of x = a+b, y = b+c, z = a+c.
    // It is x-y+z = a+b-b-c+a+c = 2a.
    // =>
    // a = (x-y+z)/2
    // b = x-a
    // c = z-a
    let x = f(0, 1);
    let y = f(1, 2);
    let z = f(0, 2);
    result.push((x - y + z) / 2);
    result.push(x - result[0]);
    result.push(z - result[0]);
    // Calculate the other values step by step.
    for i in 3..n {
        // f(i,i-1) = result[i] + result[i-1]
        // =>
        // result[i] = f(i,i-1) - result[i-1]
        result.push(f(i, i - 1) - result[i - 1]);
    }
    result
}
