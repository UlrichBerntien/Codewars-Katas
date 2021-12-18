-- IN: table 'moves' with columns 'position' and 'roll'
-- OUT: table with a column 'res'
SELECT position+2*roll AS res FROM moves;