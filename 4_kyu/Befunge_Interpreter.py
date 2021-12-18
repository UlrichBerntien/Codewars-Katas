import random
from enum import Enum
from typing import Dict, Callable, List, Tuple


class Stack(object):
    """
    Stack of the Befunge-93 Interpreter, a stack of integers
    """

    def __init__(self):
        """Create empty stack"""
        self._item: List[int] = []

    def __str__(self):
        """The content of the stack."""
        return "STACK-" + str(self._item)

    def push(self, x: int) -> None:
        """Push an integer to the stack"""
        self._item.append(x)

    def pop(self) -> int:
        """Pop an integer from the stack. Returns 0 if stack is empty"""
        if self._item:
            return self._item.pop()
        else:
            return 0

    def dup(self) -> None:
        """Dup the integer at the top of the stack. Push 0 if stack is empty"""
        if self._item:
            self._item.append(self._item[-1])
        else:
            self._item.append(0)


class InstructionPointer:
    """
    Instruction Pointer of the Befunge-93 Interpreter, wraps around the screen.
    x coordinate 0..width-1 from left to right.
    y coordinate 0..height-1 from top to bottom.
    """

    def __init__(self, width: int, height: int) -> None:
        """Start with IP at top left cell and in right direction movement."""
        if width < 1 or height < 1:
            raise ValueError("Screen empty")
        self._x_size = width
        self._y_size = height
        self._x = 0
        self._y = 0
        self._step = self._right

    def __str__(self):
        """Position of the IP."""
        return f"IP-({self._x},{self._y})"

    @property
    def x(self) -> int:
        """The x coordinate (column number) of the current IP position."""
        return self._x

    @property
    def y(self) -> int:
        """The y coordinate (row number) of the current IP position."""
        return self._y

    @property
    def xy(self) -> Tuple[int, int]:
        """The x and y coordinate of the current IP position."""
        return self._x, self._y

    def _right(self) -> None:
        """Move IP right to the next cell."""
        self._x += 1
        if self._x >= self._x_size:
            self._x = 0
            self._y = (self._y + 1) % self._y_size

    def _left(self) -> None:
        """Move IP left to the next cell."""
        self._x -= 1
        if self._x < 0:
            self._x = self._x_size - 1
            self._y = (self._y + self._y_size - 1) % self._y_size

    def _down(self) -> None:
        """Move IP down to the next cell."""
        self._y += 1
        if self._y >= self._y_size:
            self._y = 0
            self._x = (self._x + 1) % self._x_size

    def _up(self) -> None:
        """Move IP up to the next cell."""
        self._y -= 1
        if self._y < 0:
            self._y = self._y_size - 1
            self._x = (self._x + self._x_size - 1) % self._x_size

    def next(self) -> None:
        """Move IP to next cell without direction change."""
        self._step()

    def start_right(self) -> None:
        """Start moving IP in the right direction."""
        self._step = self._right

    def start_left(self) -> None:
        """Start moving IP in the left direction."""
        self._step = self._left

    def start_down(self) -> None:
        """Start moving IP in the down direction."""
        self._step = self._down

    def start_up(self) -> None:
        """Start moving IP in the up direction."""
        self._step = self._up

    def start_random(self) -> None:
        """Start moving IP in a random direction."""
        random.choice((self.start_right, self.start_left, self.start_down, self.start_up))()


class InterpreterMode(Enum):
    """Modes of the screen data interpretation."""
    STRING_MODE = 2
    NEXT = 1
    END = 0


class Screen(object):
    """
    Screen of the Befunge-93 Interpreter.
    The 2D screen is stored flat in a 1D list.
    Character and the Operations are stored to reduce the Operation search time.
    """

    def __init__(self, screen_as_string: str, interpreter) -> None:
        """Translates string to screen."""
        lines = screen_as_string.splitlines(keepends=False)
        self._height: int = len(lines)
        if self._height < 1:
            raise ValueError("screen empty")
        self._width: int = max(len(line) for line in lines)
        if self._width < 1:
            raise ValueError("screen lines empty")
        self._chars: List[str] = []
        self._ops: List[Callable] = []
        for line in lines:
            # fill short lines with space/nop
            for char in line.ljust(self._width):
                self._chars.append(char)
                self._ops.append(interpreter.get_op(char))

    def _index(self, x: int, y: int) -> int:
        """Coordinate x,y to index in the flat lists."""
        if x < 0 or x >= self._width:
            raise ValueError("screen coordinate x out of range")
        if y < 0 or y >= self._height:
            raise ValueError("screen coordinate y out of range")
        return x + y * self._width

    @property
    def width(self) -> int:
        """width of the screen."""
        return self._width

    @property
    def height(self) -> int:
        """Height of the screen."""
        return self._height

    def set(self, x: int, y: int, code: str, interpreter):
        """Set code in cell x,y."""
        self._chars[self._index(x, y)] = code
        self._ops[self._index(x, y)] = interpreter.get_op(code)

    def get_char(self, x: int, y: int) -> str:
        """Get the character in the cell x,y."""
        return self._chars[self._index(x, y)]

    def get_op(self, x: int, y: int) -> Callable[[object], InterpreterMode]:
        """Get the operation associated to the character in the cell x,y."""
        return self._ops[self._index(x, y)]


class BefungeInterpreter(object):
    """Befunge-93 Interpreter, Codewars Modification."""

    # Dictionary Befunge code character to callable method
    _ops: Dict[str, Callable] = {}

    @staticmethod
    def _push_number(n: int):
        """Generate: 0-9 Push this number onto the stack."""

        def push_number(sf) -> InterpreterMode:
            """Push n."""
            sf._stack.push(n)
            return InterpreterMode.NEXT

        return push_number

    @classmethod
    def _generate_ops(cls) -> None:
        """Generate the Befunge code table in cls._ops."""
        # The codes 0-9 generated in a loop
        for i in range(0, 10):
            cls._ops[str(i)] = cls._push_number(i)
        # In the doc strings of all _op_* methods is the first character the Befunge code.
        for item in dir(cls):
            if item.startswith('_op_'):
                foo = getattr(cls, item)
                cls._ops[foo.__doc__[0]] = foo

    def __init__(self):
        """Creates empty Interpreter."""
        if not self._ops:
            self._generate_ops()
        self._ip = None
        self._screen = None
        self._stack = None
        self._output = ""

    def _op_add(self) -> InterpreterMode:
        """+ Addition: Pop a and b, then push a+b."""
        self._stack.push(self._stack.pop() + self._stack.pop())
        return InterpreterMode.NEXT

    def _op_sub(self) -> InterpreterMode:
        """- Subtraction: Pop a and b, then push b-a."""
        a = self._stack.pop()
        b = self._stack.pop()
        self._stack.push(b - a)
        return InterpreterMode.NEXT

    def _op_mul(self) -> InterpreterMode:
        """* Multiplication: Pop a and b, then push a*b."""
        self._stack.push(self._stack.pop() * self._stack.pop())
        return InterpreterMode.NEXT

    def _op_div(self) -> InterpreterMode:
        """/ Integer division: Pop a and b, then push b/a, rounded down. If a is zero, push zero."""
        a = self._stack.pop()
        b = self._stack.pop()
        self._stack.push(b // a if a != 0 else 0)
        return InterpreterMode.NEXT

    def _op_mod(self) -> InterpreterMode:
        """% Modulo: Pop a and b, then push the b%a. If a is zero, push zero."""
        a = self._stack.pop()
        b = self._stack.pop()
        self._stack.push(b % a if a != 0 else 0)
        return InterpreterMode.NEXT

    def _op_not(self) -> InterpreterMode:
        """! Logical NOT: Pop a value. If the value is zero, push 1; otherwise, push zero."""
        self._stack.push(0 if self._stack.pop() else 1)
        return InterpreterMode.NEXT

    def _op_ge(self) -> InterpreterMode:
        """` (backtick) Greater than: Pop a and b, then push 1 if b>a, otherwise push zero."""
        a = self._stack.pop()
        b = self._stack.pop()
        self._stack.push(1 if b > a else 0)
        return InterpreterMode.NEXT

    def _op_start_right(self) -> InterpreterMode:
        """> Start moving right."""
        self._ip.start_right()
        return InterpreterMode.NEXT

    def _op_start_left(self) -> InterpreterMode:
        """< Start moving left."""
        self._ip.start_left()
        return InterpreterMode.NEXT

    def _op_start_up(self) -> InterpreterMode:
        """^ Start moving up."""
        self._ip.start_up()
        return InterpreterMode.NEXT

    def _op_start_down(self) -> InterpreterMode:
        """v Start moving down."""
        self._ip.start_down()
        return InterpreterMode.NEXT

    def _op_start_random(self) -> InterpreterMode:
        """? Start moving in a random cardinal direction."""
        self._ip.start_random()
        return InterpreterMode.NEXT

    def _op_pop_horizontal(self) -> InterpreterMode:
        """_ Pop a value; move right if value = 0, left otherwise."""
        if self._stack.pop() == 0:
            self._ip.start_right()
        else:
            self._ip.start_left()
        return InterpreterMode.NEXT

    def _op_pop_vertical(self) -> InterpreterMode:
        """| Pop a value; move down if value = 0, up otherwise."""
        if self._stack.pop() == 0:
            self._ip.start_down()
        else:
            self._ip.start_up()
        return InterpreterMode.NEXT

    def _op_string_mode(self) -> InterpreterMode:
        """" Start string mode: push each character's ASCII value all the way up to the next "."""
        return InterpreterMode.STRING_MODE

    def _op_dup(self) -> InterpreterMode:
        """: Duplicate value on top of the stack.
        If there is nothing on top of the stack, push a 0."""
        self._stack.dup()
        return InterpreterMode.NEXT

    def _op_swap(self) -> InterpreterMode:
        """\\ Swap two values on top of the stack.
        If there is only one value, pretend there is an extra 0 on bottom of the stack."""
        a = self._stack.pop()
        b = self._stack.pop()
        self._stack.push(a)
        self._stack.push(b)
        return InterpreterMode.NEXT

    def _op_pop(self) -> InterpreterMode:
        """$ Pop value from the stack and discard it."""
        self._stack.pop()
        return InterpreterMode.NEXT

    def _op_pop_output_int(self) -> InterpreterMode:
        """. Pop value and output as an integer."""
        self._output += str(self._stack.pop())
        return InterpreterMode.NEXT

    def _op_pop_output_chr(self) -> InterpreterMode:
        """, Pop value and output the ASCII character represented by the integer code that is stored in the value."""
        self._output += chr(self._stack.pop())
        return InterpreterMode.NEXT

    def _op_skip(self) -> InterpreterMode:
        """# Trampoline: Skip next cell."""
        self._ip.next()
        return InterpreterMode.NEXT

    def _op_set(self) -> InterpreterMode:
        """p A "put" call (a way to store a value for later use).
        Pop y, x and v, then change the character at the position (x,y)
        in the program to the character with ASCII value v."""
        y = self._stack.pop()
        x = self._stack.pop()
        v = self._stack.pop()
        self._screen.set(x, y, chr(v), self)
        return InterpreterMode.NEXT

    def _op_get(self) -> InterpreterMode:
        """g A "get" call (a way to retrieve data in storage).
        Pop y and x, then push ASCII value of the character at that position in the program."""
        y = self._stack.pop()
        x = self._stack.pop()
        self._stack.push(ord(self._screen.get_char(x, y)))
        return InterpreterMode.NEXT

    def _op_end(self) -> InterpreterMode:
        """@ End program."""
        return InterpreterMode.END

    def _op_nop(self) -> InterpreterMode:
        """  (i.e. a space) No-op. Does nothing."""
        return InterpreterMode.NEXT

    def get_op(self, code: str) -> Callable[[object], InterpreterMode]:
        """Get method according to the code. Return nop if no method is defined for the code."""
        if not code or len(code) != 1:
            raise ValueError("code must be a character")
        if code in self._ops:
            return self._ops[code]
        else:
            return self._ops[" "]

    def interpret(self, screen_as_string: str) -> str:
        """Interpret a Befunge Script given in the string. Return the output"""
        self._screen = Screen(screen_as_string, self)
        self._ip = InstructionPointer(self._screen.width, self._screen.height)
        self._stack = Stack()
        self._output = ""
        mode = InterpreterMode.NEXT
        while mode != InterpreterMode.END:
            while mode == InterpreterMode.NEXT:
                mode = self._screen.get_op(*self._ip.xy)(self)
                self._ip.next()
            while mode == InterpreterMode.STRING_MODE:
                c = self._screen.get_char(*self._ip.xy)
                if c != '"':
                    self._stack.push(ord(c))
                else:
                    mode = InterpreterMode.NEXT
                self._ip.next()
        return self._output


# only one interpreter create for all function calls.
befungeInterpreter = BefungeInterpreter()


def interpret(code: str) -> str:
    return befungeInterpreter.interpret(code)
