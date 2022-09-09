#include <assert.h>
#include <stdbool.h>
#include <stddef.h>

// Type hold the status of a field in the maze.
typedef enum
{
  safe = 0,
  wall = 1,
  start = 2,
  finish = 3
}
field_t;


// Holds constant n x n maze.
typedef struct
{
  int n;
  const field_t* field;
}
maze_t;


// Position in the maze
typedef struct
{
  int x, y;
}
position_t;


// Searchs start position in the maze.
// Returns false if no start position found.
static bool get_start( const maze_t *const maze, position_t *const pos )
{
  for( int i = 0; i < maze->n*maze->n; ++i )
  {
    if( maze->field[i] == start )
    {
      pos->x = i % maze->n;
      pos->y = i / maze->n;
      return true;  
    }
  }
  return false;
}


// Gets field value.
// Returns wall if pos is outside the maze.
static field_t get_field( const maze_t *const maze, const position_t *const pos )
{
  if( pos->x < 0 || pos->x >= maze->n || pos->y < 0 || pos->y >= maze->n )
    return wall;
  return maze->field[pos->x + pos->y * maze->n];
}

// Returns result of a walk in the maze.
char* maze_runner(const int *const maze, const size_t n, const char directions[]) {
  assert( maze != NULL && directions != NULL );
  assert( n <= 46340 ); // address fields by integer must work
  assert( sizeof (int) == sizeof (field_t) ); // cast to field_T must work
  const maze_t mz = { (int) n, (const field_t*) maze };
  position_t current;
  get_start( &mz, &current );
  for( const char* step = directions; *step; ++step )
  {
    switch( *step )
    {
      case 'N' :
        --current.y;
        break;
      case 'S' :
        ++current.y;
        break;
      case 'W' :
        --current.x;
        break;
      case 'E' :
        ++current.x;
        break;
    }
    switch( get_field(&mz, &current) )
    {
      case finish:
        return "Finish";
      case wall:
        return "Dead";
      default:
        break; // go on in the maze  
    }
  }
  return "Lost";
}
