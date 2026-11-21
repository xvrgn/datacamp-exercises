## Putting the CTEs together

Now that you've created the two subqueries identifying the home and away team opponents, it's time to rearrange your query with the `home` and `away` subqueries as _Common Table Expressions_ (CTEs). You'll notice that the main query includes the phrase, `SELECT DISTINCT`. Without identifying only `DISTINCT` matches, you might return a duplicate record for each game played.

Continue building the query to extract all matches played by Manchester United in the 2014/2015 season.

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task 1:** Declare the `home` and `away` CTEs before your main query.
```SQL
-- Set up the home team CTE
WITH home AS (
	SELECT m.id, t.team_long_name,
    CASE 
	    WHEN m.home_goal > m.away_goal THEN 'MU Win'
	    WHEN m.home_goal < m.away_goal THEN 'MU Loss' 
		ELSE 'Tie' END AS outcome
	FROM match AS m
	LEFT JOIN team AS t ON m.hometeam_id = t.team_api_id),
-- Set up the away team CTE
away AS (
	SELECT m.id, t.team_long_name,
    CASE 
	    WHEN m.home_goal > m.away_goal THEN 'MU Loss'
	    WHEN m.home_goal < m.away_goal THEN 'MU Win' 
	    ELSE 'Tie' END AS outcome
	FROM match AS m
	LEFT JOIN team AS t ON m.awayteam_id = t.team_api_id)
```

**Task 2:** Join your CTEs to the match table using a `LEFT JOIN`.
```SQL
-- Join the CTEs onto the match table
FROM match AS m
LEFT JOIN home ON m.id = home.id
LEFT JOIN away ON m.id = away.id
```

**Task 3:** Select the relevant data from the CTEs into the main query.
```sql
SELECT
	home.team_long_name,
	away.team_long_name
```

**Task 4:** Select the date from `match`, team names from the CTEs, and home/ away goals from `match` in the main query.
```sql
-- Select the date, team names and goals
SELECT DISTINCT
    m.date,
    home.team_long_name AS home_team_name,
    away.team_long_name AS away_team_name,
    m.home_goal,
    m.away_goal
```

**Final query**
```sql
WITH home AS (
	SELECT m.id, t.team_long_name,
    CASE 
	    WHEN m.home_goal > m.away_goal THEN 'MU Win'
	    WHEN m.home_goal < m.away_goal THEN 'MU Loss' 
	    ELSE 'Tie' END AS outcome
	FROM match AS m
	LEFT JOIN team AS t 
	ON m.hometeam_id = t.team_api_id),
away AS (
	SELECT m.id, t.team_long_name,
	CASE
		WHEN m.home_goal > m.away_goal THEN 'MU Loss'
		WHEN m.home_goal < m.away_goal THEN 'MU Win' 
		ELSE 'Tie' END AS outcome
	FROM match AS m
	LEFT JOIN team AS t 
	ON m.awayteam_id = t.team_api_id)
SELECT DISTINCT
	m.date,
    home.team_long_name AS home_team_name,
    away.team_long_name AS away_team_name,
    m.home_goal,
    m.away_goal
FROM match AS m
LEFT JOIN home ON m.id = home.id
LEFT JOIN away ON m.id = away.id
WHERE m.season = '2014/2015'
	AND (home.team_long_name = 'Manchester United' 
	OR away.team_long_name = 'Manchester United');
```
