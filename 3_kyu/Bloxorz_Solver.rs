mod blox {
    use std::collections::LinkedList;

    // Solves the Bloxors puzzle.
    // https://www.coolmathgames.com/0-bloxorz
    // A block is rolled on a table of squared tiles.
    // The block must be rolled from a start tile to a destination tile.
    // Argument is the world of tiles ins strings.coolmathgames
    // Return is a shortest path of roll movement (Up, Down, Left, Right).
    pub fn blox_solver(puzzle: &[&str]) -> String {
        let mut w = World::from(puzzle);
        let mut path_ends: LinkedList<Block> = LinkedList::new();
        // Exceute a breadth-first search with current path ends in path_ends list.
        path_ends.push_back(w.start);
        while !path_ends.is_empty() {
            let last_block = path_ends.pop_front().unwrap();
            for &test_step in MOVEMENT_SET.iter() {
                let now = last_block.flip(test_step);
                if w.is_block_ok(&now) && w.is_block_new(&now) {
                    w.store_block(&last_block, &now, test_step);
                    path_ends.push_back(now);
                    if w.is_block_destination(&now) {
                        // Found a path from start to the destination
                        return w.path_as_string(&now);
                    }
                }
            }
        }
        // No path found
        String::new()
    }

    // Position of a tiles.
    // plus x axis orientation is to right/to east.
    // plus y axis orientation is to lower/to south.
    //    .-->
    //    |
    //    V
    // Coordinate values are signed to allow checks of block movements
    // in all directions also near of the table boundary.
    #[derive(Clone, Copy, PartialEq)]
    struct Position {
        x: i16,
        y: i16,
    }

    impl Position {
        // Move in x direction.
        fn mx(&self, delta: i16) -> Position {
            Position {
                x: self.x + delta,
                y: self.y,
            }
        }

        // Move in y direction.
        fn my(&self, delta: i16) -> Position {
            Position {
                x: self.x,
                y: self.y + delta,
            }
        }
    }

    // Orientation of a block on the table.
    #[derive(Clone, Copy, PartialEq)]
    enum Orientation {
        Upright, // upright on single tiles
        AlongX,  // along x axis on two tiles (x,y) and (x+1,y)
        AlongY,  // along y axis on two tiles (x,y) and (x,y+1)
    }

    // Movement options of a block.
    #[derive(Clone, Copy, PartialEq)]
    enum Movement {
        Up,    // into -y direction
        Down,  // into +y direction
        Left,  // into -x direction
        Right, // into +x direction
    }

    // Set of all movements for iterations.
    const MOVEMENT_SET: [Movement; 4] = [
        Movement::Up,
        Movement::Down,
        Movement::Left,
        Movement::Right,
    ];

    impl Movement {
        // Converts movement into path step character.
        fn as_char(&self) -> char {
            match self {
                Movement::Up => 'U',
                Movement::Down => 'D',
                Movement::Left => 'L',
                Movement::Right => 'R',
            }
        }
    }

    // Position and orientation of a block.
    // If the blocks lies on two tiles, the left, upper title is used as position.
    // The position is min(x value of all tiles), min(y value of all tiles)
    #[derive(Clone, Copy, PartialEq)]
    struct Block {
        p: Position,    // position of the block
        o: Orientation, // orientation on the table
    }

    impl Block {
        // Flip the block in the given direction.
        // Returns the new block position and orientation.
        fn flip(&self, direction: Movement) -> Block {
            match (self.o, direction) {
                (Orientation::Upright, Movement::Up) => Block {
                    p: self.p.my(-2),
                    o: Orientation::AlongY,
                },
                (Orientation::Upright, Movement::Down) => Block {
                    p: self.p.my(1),
                    o: Orientation::AlongY,
                },
                (Orientation::Upright, Movement::Left) => Block {
                    p: self.p.mx(-2),
                    o: Orientation::AlongX,
                },
                (Orientation::Upright, Movement::Right) => Block {
                    p: self.p.mx(1),
                    o: Orientation::AlongX,
                },
                (Orientation::AlongX, Movement::Up) => Block {
                    p: self.p.my(-1),
                    o: self.o,
                },
                (Orientation::AlongX, Movement::Down) => Block {
                    p: self.p.my(1),
                    o: self.o,
                },
                (Orientation::AlongX, Movement::Left) => Block {
                    p: self.p.mx(-1),
                    o: Orientation::Upright,
                },
                (Orientation::AlongX, Movement::Right) => Block {
                    p: self.p.mx(2),
                    o: Orientation::Upright,
                },
                (Orientation::AlongY, Movement::Up) => Block {
                    p: self.p.my(-1),
                    o: Orientation::Upright,
                },
                (Orientation::AlongY, Movement::Down) => Block {
                    p: self.p.my(2),
                    o: Orientation::Upright,
                },
                (Orientation::AlongY, Movement::Left) => Block {
                    p: self.p.mx(-1),
                    o: self.o,
                },
                (Orientation::AlongY, Movement::Right) => Block {
                    p: self.p.mx(1),
                    o: self.o,
                },
            }
        }
    }

    // Kind of a tile
    #[derive(Clone, Copy, PartialEq)]
    enum TileKind {
        Air,         // not a tile, only air
        Solid,       // solid title
        Destination, // the destination to reach
        Start,       // the start position of the block
    }

    // Paths starts all at the start tile.
    // The steps are stored in the tiles data structs.
    // Only the shortest path to a tile with each possible orientation is needed.
    // So only one step to reach a tile with a block-orientation is enough storage.
    #[derive(Clone, Copy, PartialEq)]
    struct PathStep {
        before: Block,  // position and orientation of the block a step start
        step: Movement, // movement in this step
    }

    // Data of a tile and parts of the current paths stored in the tile structure.
    #[derive(Clone, Copy)]
    struct Tile {
        kind: TileKind,                // kind of this tile
        pre_upright: Option<PathStep>, // step to place a block upright on this tile
        pre_along_x: Option<PathStep>, // step to place a block along-x on this tile
        pre_along_y: Option<PathStep>, // step to place a block along-y on this tile
    }

    // The world of the puzzle.
    // All tiles and the start position/orientation of the block.
    struct World {
        start: Block,     // start status of the block
        x_size: usize,    // x size of the world
        y_size: usize,    // y size of the world
        tiles: Vec<Tile>, // all tiles
    }

    impl World {
        // Generates the world based on the string description.
        fn from(puzzle: &[&str]) -> Self {
            let y_size: usize = puzzle.len();
            let x_size: usize = puzzle.iter().map(|s| s.len()).max().unwrap_or(0);
            let tiles: Vec<Tile> = Self::strings_to_tiles(puzzle, x_size, y_size);
            let start: Block = Self::find_start(&tiles, x_size);
            World {
                start,
                x_size,
                y_size,
                tiles,
            }
        }

        // Checks if the block position and orientation is ok.
        // Returns true if the full block is supported by solid tiles.
        fn is_block_ok(&self, blk: &Block) -> bool {
            if blk.p.x < 0
                || blk.p.y < 0
                || blk.p.x as usize >= self.x_size
                || blk.p.y as usize >= self.y_size
            {
                return false;
            }
            let index = blk.p.x as usize + (blk.p.y as usize) * self.x_size;
            if self.tiles[index].kind == TileKind::Air {
                return false;
            }
            if blk.o == Orientation::AlongX {
                let index = index + 1;
                if blk.p.x as usize + 1 >= self.x_size || self.tiles[index].kind == TileKind::Air {
                    return false;
                }
            }
            if blk.o == Orientation::AlongY {
                let index = index + self.x_size;
                if blk.p.y as usize + 1 >= self.y_size || self.tiles[index].kind == TileKind::Air {
                    return false;
                }
            }
            true
        }

        // Checks if the block position and orientation is not reached before.
        fn is_block_new(&self, blk: &Block) -> bool {
            let index = blk.p.x as usize + (blk.p.y as usize) * self.x_size;
            match blk.o {
                Orientation::Upright => self.tiles[index].pre_upright.is_none(),
                Orientation::AlongX => self.tiles[index].pre_along_x.is_none(),
                Orientation::AlongY => self.tiles[index].pre_along_y.is_none(),
            }
        }

        // Checks if the block position and orientation is a destination.
        fn is_block_destination(&self, blk: &Block) -> bool {
            let index = blk.p.x as usize + (blk.p.y as usize) * self.x_size;
            blk.o == Orientation::Upright && self.tiles[index].kind == TileKind::Destination
        }

        // Checks if the block position and orientation is a start.
        fn is_block_start(&self, blk: &Block) -> bool {
            // the current implementation supports only upright start orientation
            let index = blk.p.x as usize + (blk.p.y as usize) * self.x_size;
            blk.o == Orientation::Upright && self.tiles[index].kind == TileKind::Start
        }
        // Stores the step to reach the new block position and orientation.
        fn store_block(&mut self, before: &Block, now: &Block, step: Movement) {
            let index = now.p.x as usize + (now.p.y as usize) * self.x_size;
            let path_step: PathStep = PathStep {
                before: *before,
                step,
            };
            match now.o {
                Orientation::Upright => self.tiles[index].pre_upright = Some(path_step),
                Orientation::AlongX => self.tiles[index].pre_along_x = Some(path_step),
                Orientation::AlongY => self.tiles[index].pre_along_y = Some(path_step),
            };
        }

        // Stores the path from start block to the end block in a string.
        fn path_as_string(&self, end: &Block) -> String {
            let mut accu: Vec<char> = Vec::new();
            let mut now: &Block = end;
            while !self.is_block_start(now) {
                let index = now.p.x as usize + (now.p.y as usize) * self.x_size;
                let pre = match now.o {
                    Orientation::Upright => &self.tiles[index].pre_upright,
                    Orientation::AlongX => &self.tiles[index].pre_along_x,
                    Orientation::AlongY => &self.tiles[index].pre_along_y,
                };
                match pre {
                    Some(x) => {
                        now = &x.before;
                        accu.push(x.step.as_char());
                    }
                    None => panic!("path is brocken"),
                };
            }
            accu.iter().rev().collect()
        }

        // Converts the tiles stored in strings into Tile datastructure.
        fn strings_to_tiles(s: &[&str], x_size: usize, y_size: usize) -> Vec<Tile> {
            let mut d: Vec<Tile> = Vec::with_capacity(x_size * y_size);
            let mut d_must_size: usize = 0;
            for row in s {
                d_must_size += x_size;
                for c in row.chars() {
                    let kind = match c {
                        '1' => TileKind::Solid,
                        '0' => TileKind::Air,
                        'B' => TileKind::Start,
                        'X' => TileKind::Destination,
                        _ => TileKind::Air, // Interpret all invalid chars as air tiles
                    };
                    d.push(Tile {
                        kind,
                        pre_upright: None,
                        pre_along_x: None,
                        pre_along_y: None,
                    });
                }
                // Fill a row with air tiles if the string is to short.
                d.resize(
                    d_must_size,
                    Tile {
                        kind: TileKind::Air,
                        pre_upright: None,
                        pre_along_x: None,
                        pre_along_y: None,
                    },
                );
            }
            d
        }

        // Find start position/orientation of the block start.
        // Uses (0,0) is no start tile is on the table.
        // Uses the first tile if more than one is on the table.
        fn find_start(table: &[Tile], x_size: usize) -> Block {
            // Current implementation supports upright orientation only.
            let index = table
                .iter()
                .position(|&t| t.kind == TileKind::Start)
                .unwrap_or(0);
            Block {
                p: Position {
                    x: (index % x_size) as i16,
                    y: (index / x_size) as i16,
                },
                o: Orientation::Upright,
            }
        }
    }
}
