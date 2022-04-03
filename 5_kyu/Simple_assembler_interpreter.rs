use std::collections::HashMap;

// The machine ------------------------------------------------------------------

// The register set.
// The Operations works on a slice.
// A vector to host the slice is allocated at machine start.
type Registers = [i64];

// Type of all Operation.
// All operations returned the delta to the next operation.
// Some operations uses only the first parameter.
// The interpretation of the parameters dependes on the operation
// The parameters are index to a register or numbers.
type Operation = fn(i64, i64, &mut Registers) -> i64;

// A compiled Instruction.
struct Instruction {
    op: Operation,
    x: i64,
    y: i64,
}

// A Machine with program code and register set.
struct Machine {
    // The compiled assembler program.
    code: Vec<Instruction>,
    // The register set.
    // Number of Registers depends on the program.
    reg: Vec<i64>,
    // Names of the Registers, Mapping is Name to index.
    reg_names: HashMap<String, i64>,
}

// No operation.
fn op_nop(_: i64, _: i64, _: &mut Registers) -> i64 {
    1
}

// Copy register y to register x
fn op_mov_reg(x: i64, y: i64, reg: &mut Registers) -> i64 {
    reg[x as usize] = reg[y as usize];
    1
}

// Copy constant y to register x
fn op_mov_const(x: i64, y: i64, reg: &mut Registers) -> i64 {
    reg[x as usize] = y;
    1
}

// Increment register x
fn op_inc(x: i64, _: i64, reg: &mut Registers) -> i64 {
    reg[x as usize] += 1;
    1
}

// Decrement register x
fn op_dec(x: i64, _: i64, reg: &mut Registers) -> i64 {
    reg[x as usize] -= 1;
    1
}

// Jumps delta instructions if register x is not zero.
fn op_jnz(x: i64, delta: i64, reg: &mut Registers) -> i64 {
    if reg[x as usize] != 0 {
        delta
    } else {
        1
    }
}

// Jumps delta instructions.
fn op_jmp(_: i64, delta: i64, _: &mut Registers) -> i64 {
    delta
}

// Runs the program in the machine.
fn run(machine: &mut Machine) {
    machine.reg.clear();
    machine.reg.resize(machine.reg_names.len(), 0);
    let code_len = machine.code.len() as i64;
    let mut ip = 0_i64;
    while 0 <= ip && ip < code_len {
        let step = &machine.code[ip as usize];
        ip += (step.op)(step.x, step.y, &mut machine.reg)
    }
}

// Copiers the values of the registers into a HashMap.
fn get_registers(machine: &Machine) -> HashMap<String, i64> {
    machine
        .reg_names
        .iter()
        .map(|(key, &value)| (key.clone(), machine.reg[value as usize]))
        .collect()
}

// The parser ------------------------------------------------------------------

// An argument could be a register or a constant.
// Register is stored as index in the register vector of the machine.
enum InstructionArg {
    Register(i64),
    Constant(i64),
    Missing,
}

// Analyses one argument of the instruction.
// Index the index in the instruction array.
// Creates a new register if the name is never used before.
fn one_arg(
    reg_names: &mut HashMap<String, i64>,
    instruction: &[&str],
    index: usize,
) -> InstructionArg {
    // Agument could be missing
    if index >= instruction.len() {
        return InstructionArg::Missing;
    }
    // Argument could be a constant decimal number
    let arg = instruction[index];
    if let Ok(n) = arg.parse() {
        return InstructionArg::Constant(n);
    }
    // Argument could be a known register name
    if let Some(r) = reg_names.get(arg) {
        return InstructionArg::Register(*r);
    }
    // Argument could be a new register name
    let next = reg_names.len() as i64;
    reg_names.insert(arg.to_string(), next);
    InstructionArg::Register(next)
}

// Analyses the two argument of the instruction.
// Creates a new register if the name is never used before.
fn two_args(
    reg_names: &mut HashMap<String, i64>,
    instruction: &[&str],
) -> (InstructionArg, InstructionArg) {
    (
        one_arg(reg_names, instruction, 1),
        one_arg(reg_names, instruction, 2),
    )
}

// Compile the strings into Instructions
fn compile(program: Vec<&str>) -> Machine {
    let mut machine = Machine {
        code: Vec::with_capacity(program.len()),
        reg: Vec::new(),
        reg_names: HashMap::new(),
    };
    for it in program {
        let op_x_y: Vec<&str> = it.split_whitespace().collect();
        if !op_x_y.is_empty() {
            let (x, y) = two_args(&mut machine.reg_names, &op_x_y);
            match (op_x_y[0], x, y) {
                ("mov", InstructionArg::Register(rx), InstructionArg::Register(ry)) => {
                    machine.code.push(Instruction {
                        op: op_mov_reg,
                        x: rx,
                        y: ry,
                    })
                }
                ("mov", InstructionArg::Register(rx), InstructionArg::Constant(c)) => {
                    machine.code.push(Instruction {
                        op: op_mov_const,
                        x: rx,
                        y: c,
                    })
                }
                ("inc", InstructionArg::Register(r), InstructionArg::Missing) => {
                    machine.code.push(Instruction {
                        op: op_inc,
                        x: r,
                        y: 0,
                    })
                }
                ("dec", InstructionArg::Register(r), InstructionArg::Missing) => {
                    machine.code.push(Instruction {
                        op: op_dec,
                        x: r,
                        y: 0,
                    })
                }
                ("jnz", InstructionArg::Register(r), InstructionArg::Constant(delta)) => {
                    machine.code.push(Instruction {
                        op: op_jnz,
                        x: r,
                        y: delta,
                    })
                }
                ("jnz", InstructionArg::Constant(c), InstructionArg::Constant(delta)) => {
                    machine.code.push(Instruction {
                        op: if c != 0 { op_jmp } else { op_nop },
                        x: c,
                        y: delta,
                    })
                }
                _ => panic!("invalid instruction, {}", it),
            }
        } else {
            machine.code.push(Instruction {
                op: op_nop,
                x: 0,
                y: 0,
            })
        }
    }
    machine
}

// Compile and run the assembler program.
fn simple_assembler(program: Vec<&str>) -> HashMap<String, i64> {
    let mut machine = compile(program);
    run(&mut machine);
    get_registers(&machine)
}
