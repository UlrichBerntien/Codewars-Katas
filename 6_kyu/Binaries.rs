fn code(s: &str) -> String {
    let mut accu = String::new();
    for b in s.bytes() {
        let bits = format!("{:b}", b - b'0');
        accu += &format!("{:0>width$}", 1, width = bits.len());
        accu += &bits;
    }
    accu
}

fn decode(s: &str) -> String {
    let mut accu = String::new();
    let mut stream = s.bytes();
    while stream.size_hint().1.unwrap() > 0 {
        let mut word_length = 1;
        while stream.next() == Some(b'0') {
            word_length += 1;
        }
        let mut x = 0u32;
        while word_length > 0 {
            word_length -= 1;
            x *= 2;
            if stream.next() == Some(b'1') {
                x += 1
            }
        }
        if x > 9 {
            panic!("no digit coded");
        }
        accu.push(std::char::from_u32(b'0' as u32 + x).unwrap());
    }
    accu
}
