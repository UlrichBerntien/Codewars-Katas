-- given a table 'box' with columns: width (int), height (int), depth (int)
-- return columns: width, height, depth, area (int), volume (int)
-- sort results by area, volume, width and height, all ascending
SELECT
    width,
    height,
    depth,
    2*(height*depth + width*depth +width*height) AS area,
    width*height*depth AS volume
FROM
    box
ORDER BY
    area ASC, volume ASC, width ASC, height ASC;