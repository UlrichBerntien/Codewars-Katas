use std::collections::HashMap;

struct Cipher {
    encode_map: HashMap<char, char>,
    decode_map: HashMap<char, char>,
}

impl Cipher {
    fn new(map1: &str, map2: &str) -> Cipher {
        let mut result = Cipher {
            encode_map: HashMap::with_capacity(map1.len()),
            decode_map: HashMap::with_capacity(map1.len()),
        };
        for pp in map1.chars().zip(map2.chars()) {
            result.encode_map.insert(pp.0, pp.1);
            result.decode_map.insert(pp.1, pp.0);
        }
        result
    }

    fn encode(&self, string: &str) -> String {
        string
            .chars()
            .map(|c| *self.encode_map.get(&c).unwrap_or(&c))
            .collect()
    }

    fn decode(&self, string: &str) -> String {
        string
            .chars()
            .map(|c| *self.decode_map.get(&c).unwrap_or(&c))
            .collect()
    }
}
