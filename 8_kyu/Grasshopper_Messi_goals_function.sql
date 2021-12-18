-- IN: table "goals" with columns la_liga_goals, copa_del_rey_goals, champions_league_goals
-- OUT: Table with a column, res
SELECT la_liga_goals+copa_del_rey_goals+champions_league_goals AS res FROM goals;