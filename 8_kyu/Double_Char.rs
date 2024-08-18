/// Returns copy of the string with each char doubled.
fn double_char(s: &str) -> String {
    double_chars(s.chars()).collect()
}


/// Iterator doubles all characters from the source iterator.
struct DoubleChars<'a> {
    // Source iterator.
    input : std::str::Chars<'a>,
    // Current character from the source iterator.
    current : Option<char>,
    // Is the current char already doubled?
    // false: the current char was only one time returned.
    // true: the current char was returned two times to the output
    doubled : bool,
}

impl std::iter::Iterator for DoubleChars<'_> {
    /// The type of the elements being iterated over.
    type Item = char;
    
    /// Advances the iterator and returns the next value.
    ///
    /// Each second call the the source iterator is called to get the next char.
    fn next(&mut self) -> Option<Self::Item> {
        if self.doubled {
            self.doubled = false;
            self.current = self.input.next();
            return self.current;
        } else {
            self.doubled = true;
            return self.current;
        }
    }
    
    /// Consumes the iterator, counting the number of iterations and returning it.
    fn count(self) -> usize {
        // each input char is returned twice.
        self.input.count() * 2
    }
    
    /// Consumes the iterator, returning the last element.
    fn last(self) -> Option<Self::Item> {
        // Last char of the doubled iterator is the last one of the input iterator.
        self.input.last()
    }
    
    /// Returns the bounds on the remaining length of the iterator.
    fn size_hint(&self) -> (usize, Option<usize>) {
        let (lower,upper) = self.input.size_hint();
        return ( lower*2+(!self.doubled)as usize, upper.map(|n| n*2+(!self.doubled)as usize) )
    }
}

// Returns iterator to doubled all chars of the input iterator.
fn double_chars(source :std::str::Chars) -> DoubleChars {
    DoubleChars {input: source, current: Some('x'), doubled: true  }
}
