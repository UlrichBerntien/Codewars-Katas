// Executes the functions on the input.
fn chain<F: Fn(i32)->i32>(input: i32, functions: &[F]) -> i32 {
    functions.iter().fold( input, |accu,it| it(accu) )
}
