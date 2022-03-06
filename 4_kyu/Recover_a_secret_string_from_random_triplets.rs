use std::collections::HashMap;
use std::collections::HashSet;

type CharSet = HashSet<char>;
type Char2CharSet = HashMap<char, CharSet>;

fn recover_secret(triplets: Vec<[char; 3]>) -> String {
    // Upper limit for capacity of map and sets.
    let cap = triplets.len() * 3;
    // Collect all chars before the char x.
    let mut char2before = Char2CharSet::with_capacity(cap);
    for tri in triplets.iter() {
        for c in tri {
            if !char2before.contains_key(c) {
                char2before.insert(*c, CharSet::with_capacity(cap));
            }
        }
        char2before.get_mut(&tri[2]).unwrap().insert(tri[1]);
        char2before.get_mut(&tri[2]).unwrap().insert(tri[0]);
        char2before.get_mut(&tri[1]).unwrap().insert(tri[0]);
    }
    let mut accu = String::with_capacity(cap);
    while !char2before.is_empty() {
        // The first char of the rest is the char without any char before.
        let first = char2before.iter().find(|it| it.1.is_empty());
        if first == None {
            panic!("can not solve");
        }
        let c = *first.unwrap().0;
        accu.push(c);
        // Remove the char from the rest.
        char2before.remove(&c);
        char2before.iter_mut().for_each(|it| {
            it.1.remove(&c);
        });
    }
    accu
}
