use lazy_static::lazy_static;
use regex::Regex;
use std::char;

lazy_static! {
    static ref PATTERN: Regex = Regex::new(r"^(\d{1,9})([a-z]+)$").unwrap();
    static ref ERROR_MESSAGE: &'static str = "Impossible to decode";
}

// https://rosettacode.org/wiki/Modular_inverse#Rust
fn mod_inv(a: i32, module: i32) -> i32 {
  let mut mn = (module, a);
  let mut xy = (0, 1);
   while mn.1 != 0 {
    xy = (xy.1, xy.0 - (mn.0 / mn.1) * xy.1);
    mn = (mn.1, mn.0 % mn.1);
  }
   while xy.0 < 0 {
    xy.0 += module;
  }
  xy.0
}

// Converts a -> 0, b -> 1, ... z -> 25.
fn letter2int(c: char) -> i32 {
    if c < 'a' || c > 'z' {
        panic!("invalid letter2uint parameter '{}'", c)
    }
    c as i32 - 'a' as i32
}

// Converts 0 -> a, 1 -> b, ... z -> 25.
fn int2letter(i: i32) -> char {
    if i > 25 {
        panic!("invalid uint2letter parameter {}", i)
    }
    char::from_u32( i as u32 + 'a' as u32 ).unwrap()
}

fn decode(s: &str) -> String {
    // Split and parse parameter into num and text.
    let splited = PATTERN.captures(s);
    if splited.is_none() {
        return ERROR_MESSAGE.to_string();
    }
    let splited = PATTERN.captures(s).unwrap();
    let num_str = splited.get(1).unwrap().as_str();
    let num = num_str.parse::<i32>().unwrap();
    let text = splited.get(2).unwrap().as_str();
    // Calculate inverse to decode the message
    let inv = mod_inv(num,26);
    if (num * inv) % 26 != 1 {
        return ERROR_MESSAGE.to_string();
    }
    // Decode the message
    let mut result = String::new();
    for c in text.chars() {
        result.push( int2letter((letter2int(c) * inv) % 26) );
    }
    return result
}