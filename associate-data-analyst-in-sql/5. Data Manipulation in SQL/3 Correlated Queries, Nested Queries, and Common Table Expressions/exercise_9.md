## Get team names with correlated subqueries
Let's solve the same problem using correlated subqueries -- _How do you get both the home and away team names into one final query result?_

This can easily be performed using correlated subqueries. But how might that impact the performance of your query? Complete the following steps and let's find out!

**Please note that your query will run more slowly than the previous exercise!**

#### Instructions and Solutions

##### ✅ Instruction 1/2
**Task:** Using a correlated subquery in the `SELECT` statement, match the `team_api_id` column from `team` to the `hometeam_id` from `match`.
```sql
 -- Connect the team's team_api_id to the match's hometeam_id
SELECT m.date,
	(SELECT team_long_name
    FROM team AS t
    WHERE t.team_api_id = m.hometeam_id) AS hometeam
FROM match AS m;
```
##### ✅ Instruction 2/2
**Task:** - Create a second correlated subquery in `SELECT`, yielding the **away** team's name.
```sql
SELECT m.date,
	(SELECT team_long_name
    FROM team AS t
    WHERE t.team_api_id = m.hometeam_id) AS hometeam,
    (SELECT team_long_name
    FROM team AS t
    WHERE t.team_api_id = m.awayteam_id) AS awayteam
FROM match AS m;
```

**Task 2:** Select the `home_goal` and `away_goal` columns from `match` in the **main** query.
```sql
SELECT
    m.date,
    (SELECT team_long_name
     FROM team AS t
     WHERE t.team_api_id = m.hometeam_id) AS hometeam,
    (SELECT team_long_name
     FROM team AS t
     WHERE t.team_api_id = m.awayteam_id) AS awayteam,
     m.home_goal,
     m.away_goal
FROM match AS m;
```

