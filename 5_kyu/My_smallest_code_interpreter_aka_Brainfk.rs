// Brainfuck interpreter accelerated by compiling the code into boxed traits.
// --------------------------------------------------------------------------

// increment step for data tape
const DATA_BLOCK_SIZE: usize = 0x1000;

// Workdata of a running Brainfuck machine.
struct MachineData {
    data: Vec<u8>,
    data_ptr: usize,
    output: Vec<u8>,
    reversed_input: Vec<u8>,
}

// An instruction of the Brainfuck machine.
// Returns the offset to the next code_ptr value.
trait Instruction {
    fn step(&self, brain: &mut MachineData) -> i32;
}

// Brainfuck code as boxed traits.
struct MachineCode {
    code: Vec<Box<dyn Instruction>>,
}

// --------------------------------------------------------------------------

impl MachineData {
    // Creates new machine data with given input data.
    // Stores the input data.
    // Prepares empty tape and empty output.
    fn new(input: Vec<u8>) -> Self {
        let mut it = Self {
            data: Vec::new(),
            data_ptr: 0,
            output: Vec::new(),
            reversed_input: input.to_vec(),
        };
        // Stores the input in reversed order for fast pop operation on the input data.
        it.reversed_input.reverse();
        it
    }

    // Access the current cell addressed by the data pointer.
    // Internal expands the tape if the data pointer if above the current tape end.
    fn current_cell(&mut self) -> &mut u8 {
        if self.data_ptr >= self.data.len() {
            self.data.resize(
                (self.data_ptr + DATA_BLOCK_SIZE) & !(DATA_BLOCK_SIZE - 1),
                0,
            )
        }
        &mut self.data[self.data_ptr]
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
                '-' => it.code.push(Box::new(DecInstruction {})),
                '+' => it.code.push(Box::new(IncInstruction {})),
                '.' => it.code.push(Box::new(OutputInstruction {})),
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
        // ignore decrement pointer at start of tape
        if brain.data_ptr > 0 {
            brain.data_ptr -= 1;
        }
        1
    }
}

struct IncInstruction {}
impl Instruction for IncInstruction {
    fn step(&self, brain: &mut MachineData) -> i32 {
        let result = brain.current_cell().overflowing_add(1);
        *brain.current_cell() = result.0;
        1
    }
}

struct DecInstruction {}
impl Instruction for DecInstruction {
    fn step(&self, brain: &mut MachineData) -> i32 {
        let result = brain.current_cell().overflowing_sub(1);
        *brain.current_cell() = result.0;
        1
    }
}

struct OutputInstruction {}
impl Instruction for OutputInstruction {
    fn step(&self, brain: &mut MachineData) -> i32 {
        let it = *brain.current_cell();
        brain.output.push(it);
        1
    }
}

struct InputInstruction {}
impl Instruction for InputInstruction {
    fn step(&self, brain: &mut MachineData) -> i32 {
        let it = brain.reversed_input.pop();
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
        if *brain.current_cell() == 0 {
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
        if *brain.current_cell() != 0 {
            self.distance
        } else {
            1
        }
    }
}

// --------------------------------------------------------------------------

fn brain_luck(code: &str, input: Vec<u8>) -> Vec<u8> {
    MachineCode::new(code).run(input)
}
