use regex::Regex;

fn solution(s: &str) -> String {
    let upper_regex :regex::Regex = Regex::new(r"([[:upper:]])").unwrap();
    upper_regex.replace_all(s, " $1").to_string()
}
