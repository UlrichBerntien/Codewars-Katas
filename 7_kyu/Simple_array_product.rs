use itertools::Itertools;
use itertools::MinMaxResult;

// Multiplay all elements in the slice x with factor f.
fn mul_assign(sl: &mut [i32], rhs: i32) {
    sl.iter_mut().for_each(|it| *it = *it * rhs)
}

// Calculates min-max range of a multiplication of two min-max ranges.
fn minmax_mult(x: MinMaxResult<i32>, y: MinMaxResult<i32>) -> MinMaxResult<i32> {
    let mut accu = Vec::with_capacity(4);
    match x {
        MinMaxResult::NoElements => return x,
        MinMaxResult::OneElement(m) => accu.push(m),
        MinMaxResult::MinMax(mi, ma) => {
            accu.push(mi);
            accu.push(ma)
        }
    }
    match y {
        MinMaxResult::NoElements => return y,
        MinMaxResult::OneElement(m) => mul_assign(&mut accu, m),
        MinMaxResult::MinMax(mi, ma) => {
            let s = accu.len();
            for i in 0..s {
                accu.push(accu[i])
            }
            mul_assign(&mut accu[..s], ma);
            mul_assign(&mut accu[s..], mi);
        }
    }
    accu.into_iter().minmax()
}

fn solve(vecs: &[Vec<i32>]) -> i32 {
    let result = vecs
        .iter()
        .map(|arr| arr.iter().map(|x| *x).minmax())
        .reduce(|a, b| minmax_mult(a, b));
    if result == None {
        // error exit: vecs empty.
        return 0;
    }
    match result.unwrap() {
        MinMaxResult::NoElements => 0,
        MinMaxResult::OneElement(m) => m,
        MinMaxResult::MinMax(_, m) => m,
    }
}
