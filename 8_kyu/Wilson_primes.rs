fn am_i_wilson(n: u32) -> bool {
    // https://en.wikipedia.org/wiki/Wilson_prime
    match n {
         5|13|563 => true,
         _        => false
    }
}