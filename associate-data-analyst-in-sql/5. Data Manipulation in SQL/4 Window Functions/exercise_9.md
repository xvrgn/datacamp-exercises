## Setting up the away team CTE

Great job! Now that you have a query identifying the home team in a match, you will perform a similar set of steps to identify the _away_ team. Just like the previous step, you will join the `match` and `team` tables. Each of these two queries will be declared as a _Common Table Expression_ in the following step.

The primary difference in this query is that you will be joining the tables on `awayteam_id`, and reversing the match outcomes in the `CASE` statement.

When altering `CASE` statement logic in your own work, you can reverse either the logical condition (i.e., `home_goal > away_goal`) or the outcome in `THEN` -- just make sure you only reverse one of the two!

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task 1:** Complete the `CASE` statement syntax.
```sql
-- Identify matches as home/away wins or ties
CASE 
	WHEN m.home_goal > m.away_goal THEN 'MU Loss'
	WHEN m.home_goal < m.away_goal THEN 'MU Win'
	ELSE 'Tie' END AS outcome
```

**Task 2:** Fill out the logical operators identifying each match as a win, loss, or tie for Manchester United.
```SQL
CASE 
	WHEN m.home_goal > m.away_goal THEN 'MU Loss'
	WHEN m.home_goal < m.away_goal THEN 'MU Win'
	ELSE 'Tie' END AS outcome
```

**Task 3:** Join the tables on `awayteam_id` and `team_api_id`.
```SQL
-- Join the match table's awayteam_id to the team table
FROM match AS m
LEFT JOIN team AS t 
ON m.awayteam_id = t.team_api_id
```

**Final query**
```sql
SELECT m.id, t.team_long_name,
	CASE
		WHEN m.home_goal > m.away_goal THEN 'MU Loss'
        WHEN m.home_goal < m.away_goal THEN 'MU Win'
        ELSE 'Tie' END AS outcome
FROM match AS m
LEFT JOIN team AS t 
ON m.awayteam_id = t.team_api_id
WHERE season = '2014/2015' AND t.team_long_name = 'Manchester United';
```