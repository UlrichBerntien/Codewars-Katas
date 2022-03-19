// Boolfuck interpreter accelerated by compiling the code into boxed traits.
// -------------------------------------------------------------------------

// Workdata of a running Boolfuck machine.
// Note: The bit-vec crate (https://crates.io/crates/bit-vec) is not available on codewars.
struct MachineData {
    // The tape is splitted into data_plus with index 0..m and data_minus with index -1..-n.
    data_plus: Vec<bool>,
    data_minus: Vec<bool>,
    data_ptr: i32,
    // Output as u8 needed.
    // The output bits are collected in output_accu until a u8 is complete.
    output: Vec<u8>,
    output_accu: u8,
    output_bit_counter: u8,
    // Reverse input. The first byte to read is at the end of the vector.
    // The input bits are read through input_accu.
    input_reversed: Vec<u8>,
    input_accu: u8,
    input_bit_counter: u8,
}

// An instruction of the Boolfuck machine.
// Returns the offset to the next code_ptr value.
trait Instruction {
    fn step(&self, brain: &mut MachineData) -> i32;
}

// Boolfuck code as boxed traits.
struct MachineCode {
    code: Vec<Box<dyn Instruction>>,
}

// --------------------------------------------------------------------------

// Returns the vector in reversed order.
#[inline]
fn reversed(input: Vec<u8>) -> Vec<u8> {
    let mut result = input.to_vec();
    result.reverse();
    result
}

// Calculates the smallest value greater than x that is a multiple of m.
#[inline]
fn next_multiple(x: usize, m: usize) -> usize {
    x + (m - x % m)
}

impl MachineData {
    // Creates new machine data with given input data.
    // Stores the input data.
    // Prepares empty tape and empty output.
    fn new(input: Vec<u8>) -> Self {
        Self {
            data_plus: Vec::new(),
            data_minus: Vec::new(),
            data_ptr: 0,
            output: Vec::new(),
            output_accu: 0,
            output_bit_counter: 0,
            input_reversed: reversed(input),
            input_accu: 0,
            input_bit_counter: 0,
        }
    }

    // Access the current cell addressed by the data pointer.
    // Internal a pointer behind the tape is set zo the tape end.
    fn current_cell(&mut self) -> &mut bool {
        const GROW_SIZE: usize = 10240;
        if self.data_ptr >= 0 {
            let index = self.data_ptr as usize;
            if index >= self.data_plus.len() {
                self.data_plus
                    .resize(next_multiple(index, GROW_SIZE), false)
            }
            &mut self.data_plus[index]
        } else {
            let index = -self.data_ptr as usize; // data_minus[0] is unused.
            if index >= self.data_minus.len() {
                self.data_minus
                    .resize(next_multiple(index, GROW_SIZE), false)
            }
            &mut self.data_minus[index]
        }
    }

    // Push one bit into the output stream.
    // Bits per byte come in little-endian order.
    fn output_push(&mut self, x: bool) {
        self.output_accu = self.output_accu / 2 + if x { 0x80 } else { 0 };
        self.output_bit_counter += 1;
        if self.output_bit_counter == 8 {
            self.output.push(self.output_accu);
            self.output_accu = 0;
            self.output_bit_counter = 0;
        }
    }

    // Pops one bit from the input stream.
    // Bits per byte goes out in little-endian order.
    // Returns None of input stream is empty.
    fn input_pop(&mut self) -> Option<bool> {
        if self.input_bit_counter == 0 {
            let x = self.input_reversed.pop();
            if x == None {
                return None;
            }
            self.input_accu = x.unwrap();
            self.input_bit_counter = 8;
        }
        let result = self.input_accu & 1 == 1;
        self.input_accu /= 2;
        self.input_bit_counter -= 1;
        Some(result)
    }
}

// --------------------------------------------------------------------------

impl MachineCode {
    // Compile code into boxed traits.
    fn new(code: &str) -> Self {
        let mut it = Self {
            code: Vec::with_capacity(code.len()),
        };
        let mut jump_target: Vec<i32> = Vec::new();
        for step in code.chars() {
            match step {
                '>' => it.code.push(Box::new(IncPtrInstruction {})),
                '<' => it.code.push(Box::new(DecPtrInstruction {})),
                '+' => it.code.push(Box::new(FlipInstruction {})),
                ';' => it.code.push(Box::new(OutputInstruction {})),
                ',' => it.code.push(Box::new(InputInstruction {})),
                '[' => {
                    // place a nop until the jump target is known.
                    jump_target.push(it.code.len() as i32);
                    it.code.push(Box::new(NopInstruction {}));
                }
                ']' => {
                    let target = jump_target.pop();
                    // ignore jump backward without target
                    if target != None {
                        let target = target.unwrap();
                        let delta = it.code.len() as i32 - target;
                        it.code[target as usize] = Box::new(JumpZeroInstruction {
                            distance: 1 + delta,
                        });
                        it.code.push(Box::new(JumpNotZeroInstruction {
                            distance: 1 - delta,
                        }))
                    }
                }
                _ => (/*ignore invalid codes*/),
            }
        }
        it
    }

    fn run(&mut self, input: Vec<u8>) -> Vec<u8> {
        let mut data = MachineData::new(input);
        let mut ip: i32 = 0;
        while 0 <= ip && (ip as usize) < self.code.len() {
            ip += self.code[ip as usize].step(&mut data);
        }
        // Fill the last byte with 0 bits.
        while data.output_bit_counter > 0 {
            data.output_push(false);
        }
        data.output
    }
}

struct NopInstruction {}
impl Instruction for NopInstruction {
    fn step(&self, _: &mut MachineData) -> i32 {
        1
    }
}

struct IncPtrInstruction {}
impl Instruction for IncPtrInstruction {
    fn step(&self, brain: &mut MachineData) -> i32 {
        brain.data_ptr += 1;
        1
    }
}

struct DecPtrInstruction {}
impl Instruction for DecPtrInstruction {
    fn step(&self, brain: &mut MachineData) -> i32 {
        brain.data_ptr -= 1;
        1
    }
}

struct FlipInstruction {}
impl Instruction for FlipInstruction {
    fn step(&self, brain: &mut MachineData) -> i32 {
        *brain.current_cell() = !*brain.current_cell();
        1
    }
}

struct OutputInstruction {}
impl Instruction for OutputInstruction {
    fn step(&self, brain: &mut MachineData) -> i32 {
        let it = *brain.current_cell();
        brain.output_push(it);
        1
    }
}

struct InputInstruction {}
impl Instruction for InputInstruction {
    fn step(&self, brain: &mut MachineData) -> i32 {
        let it = brain.input_pop();
        if it != None {
            *brain.current_cell() = it.unwrap();
        }
        1
    }
}

struct JumpZeroInstruction {
    distance: i32,
}
impl Instruction for JumpZeroInstruction {
    fn step(&self, brain: &mut MachineData) -> i32 {
        if !*brain.current_cell() {
            self.distance
        } else {
            1
        }
    }
}

struct JumpNotZeroInstruction {
    distance: i32,
}
impl Instruction for JumpNotZeroInstruction {
    fn step(&self, brain: &mut MachineData) -> i32 {
        if *brain.current_cell() {
            self.distance
        } else {
            1
        }
    }
}

// --------------------------------------------------------------------------

fn boolfuck(code: &str, input: Vec<u8>) -> Vec<u8> {
    MachineCode::new(code).run(input)
}
