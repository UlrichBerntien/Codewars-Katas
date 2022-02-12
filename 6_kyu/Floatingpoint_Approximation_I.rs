fn f(x: f64) -> f64 {
    // Taylor series of f(x) around x = 0, calculated with Horner method
    ((((((-5./128.*x)+1./16.)*x)-1./8.)*x)+1./2.)*x
}