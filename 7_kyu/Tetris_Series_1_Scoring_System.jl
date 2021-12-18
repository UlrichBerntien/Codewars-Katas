function getscore(lines_cleared::Array)::Int
    points_per_lines = [0, 40, 100, 300, 1200]
    total_points = 0
    level_lines = 0
    level = 0
    for lines in lines_cleared
        total_points += points_per_lines[lines+1] * (level+1)
        level_lines += lines
        if level_lines ≥ 10
            level_lines -= 10
            level += 1
         end
    end
    total_points
end