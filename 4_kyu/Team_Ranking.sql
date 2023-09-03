-- Table of top 10 teams.
-- Teams are ranked by the sum of scores reached by the top 5 player of each team.
SELECT
    RANK() OVER (ORDER BY SUM(score) DESC) AS team_rank,
    MIN(teams.name) AS team_name,
    SUM(score) AS team_score,
    STRING_AGG(members.name||' ('||score||')', ', ') AS top_members
FROM
    -- Table of ranked player per team.
    (SELECT
        id,
        team_id,
        name,
        score,
        ROW_NUMBER() OVER (PARTITION BY team_id ORDER BY score DESC, id ASC) AS rank_in_team
    FROM team_members
    ORDER BY score DESC, id ASC) AS members
JOIN teams ON teams.id = members.team_id
WHERE rank_in_team <= 5
GROUP BY team_id
ORDER BY team_score DESC, team_id ASC
LIMIT 10;
