## Add a subquery in SELECT
In the previous exercise, you added a subquery to the `FROM` statement and selected the stages where the number of average goals in a stage exceeded the overall average number of goals in the 2012/2013 match season. In this final step, you will add a subquery in `SELECT` to compare the average number of goals scored in each stage to the total.

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task 1:** Create a subquery in `SELECT` that yields the average total goals scored in the 2012/2013 season and stores it in a column named `overall_avg`
```sql
-- Select the overall average for 2012/2013
(SELECT AVG(home_goal+away_goal)
FROM match
WHERE season = '2012/2013') AS overall_avg
```

**Task 2:**  Create a subquery in `FROM` that calculates the average total goals scored in each stage during the 2012/2013 season.
```sql
-- Select the stage and average goals in 2012/2013 from match
FROM (
	SELECT stage, AVG(home_goal + away_goal) AS avg_goals
	FROM match
	WHERE season = '2012/2013'
	GROUP BY stage
) AS s
```

**Task 3:** Filter the main query for stages where the average total goals exceeds the overall average in 2012/2013.
```sql
-- Filter the main query using the subquery
WHERE s.avg_goals > (SELECT AVG(home_goal+away_goal)
					FROM match
					WHERE season = '2012/2013');
```

**Final query**
```sql
SELECT 
    stage,
    ROUND(avg_goals,2) AS avg_goal,
    (SELECT AVG(home_goal + away_goal) FROM match WHERE season = '2012/2013') AS overall_avg
FROM 
    (SELECT
         stage,
         AVG(home_goal + away_goal) AS avg_goals
     FROM match
     WHERE season = '2012/2013'
     GROUP BY stage) AS s
WHERE 
	s.avg_goals > (SELECT AVG(home_goal + away_goal) 
                    FROM match WHERE season = '2012/2013');
```
