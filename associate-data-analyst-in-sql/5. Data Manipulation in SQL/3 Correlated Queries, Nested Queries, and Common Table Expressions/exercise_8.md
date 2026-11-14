## Title
Let's solve a problem we've encountered a few times in this course so far -- _How do you get both the home and away team names into one final query result?_

Out of the 4 techniques we just discussed, this can be performed using subqueries, correlated subqueries, and CTEs. Let's practice creating similar result sets using each of these 3 methods over the next 3 exercises, starting with subqueries in `FROM`.

_**Warning:** if your code times out, you probably made a mistake in the `JOIN` and tried to join on the wrong fields, which caused the table to be too big! Read the provided code and comments carefully, and check your `ON` conditions!_

#### Instructions and Solutions

##### ✅ Instruction 1/2
**Task:** Create a query that left joins `team` to `match` in order to get the identity of the home team. This becomes the subquery in the next step.
```sql
SELECT m.id, t.team_long_name AS hometeam
FROM match AS m
LEFT JOIN team as t
ON m.hometeam_id = team_api_id;
```
##### ✅ Instruction 2/2
**Task:**- Add a second subquery to the `FROM` statement to get the away team name, changing only the `hometeam_id`. Left join both subqueries to the `match` table on the `id` column.
```sql
INNER JOIN (
  SELECT match.id, team.team_long_name AS hometeam_name
  FROM match
  LEFT JOIN team
  ON match.hometeam_id = team.team_api_id) AS home
ON home.id = m.id

INNER JOIN (
  SELECT match.id, team.team_long_name AS awayteam_name
  FROM match
  LEFT JOIN team
  ON match.awayteam_id = team.team_api_id) AS away
ON away.id = m.id;
```

**Final query**
```sql
SELECT
	m.date,
    home.hometeam_name,
    away.awayteam_name,
    m.home_goal,
    m.away_goal
FROM match AS m
INNER JOIN (
	SELECT match.id, team.team_long_name AS hometeam_name
	FROM match
	LEFT JOIN team
	ON match.hometeam_id = team.team_api_id) AS home
ON home.id = m.id
INNER JOIN (
	SELECT match.id, team.team_long_name AS awayteam_name
	FROM match
	LEFT JOIN team
	ON match.awayteam_id = team.team_api_id) AS away
ON away.id = m.id;
```

