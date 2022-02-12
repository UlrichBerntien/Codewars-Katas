use num::integer;

fn som(x: i64, y: i64) -> i64 {
    x + y
}
fn maxi(x: i64, y: i64) -> i64 {
    x.max(y)
}
fn mini(x: i64, y: i64) -> i64 {
    x.min(y)
}
fn gcdi(m: i64, n: i64) -> i64 {
    integer::gcd(m,n)
}
fn lcmu(a: i64, b: i64) -> i64 {
    integer::lcm(a,b)
}

fn oper_array( fct: fn(i64,i64) -> i64, a: &[i64], init: i64) -> Vec<i64> {
    let mut accu = init;
    a.iter().map(|&x| {accu = fct(x,accu); accu} ).collect()
}
