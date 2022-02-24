fn solution(st: &str, limit: usize) -> String {
    let mut result = String::with_capacity(limit+3);
    let mut rest = limit; 
    for c in st.chars() {
        if rest > 0 {
            rest -= 1;
            result.push(c);
        } else {
            result += "...";
            return result
        }
    }
    result
}