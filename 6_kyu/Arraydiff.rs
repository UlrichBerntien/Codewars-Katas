fn array_diff<T: PartialEq>(a: Vec<T>, b: Vec<T>) -> Vec<T> {
    let mut result: Vec<T> = a;
    result.retain(|it| !b.contains(it));
    result
}
