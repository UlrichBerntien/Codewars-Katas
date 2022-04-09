struct Person {
    name: String,
}

impl Person {
    fn new(name: &str) -> Person {
        Person {
            name: String::from(name),
        }
    }

    fn greet(&self, name: &str) -> String {
        format!("Hello {}, my name is {}", name, self.name)
    }
}
