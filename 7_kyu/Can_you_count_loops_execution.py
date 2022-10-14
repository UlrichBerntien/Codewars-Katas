# Count the number of loop condition executions of neested loops.
def count_loop_iterations(arr):
    result = []
    total_loops = 1
    for it in arr:
        inner_loops = it[0] + (1 if it[1] else 0)
        result.append(total_loops * (inner_loops+1))
        total_loops *= inner_loops
    return result
