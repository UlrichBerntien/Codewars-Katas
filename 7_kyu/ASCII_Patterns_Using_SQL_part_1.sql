-- Generate ASCII art star triangle.
-- Parameter is width and height of the triangle.
prepare draw_pattern(int) as
  SELECT LPAD('',i,'*') AS star_pattern
  FROM generate_series($1,1,-1) AS i;
