## Add a subquery in FROM
In the previous exercise, you created a data set listing the average home and away goals in each match stage of the 2012/2013 match season.

In this next step, you will turn the main query into a _subquery_ to extract a list of stages where the average total goals in a stage is higher than the _overall_ average for total goals in a match.
content

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task 1:** Calculate the average total goals from the match table for each stage in the `FROM` clause subquery.
```sql
-- Select the stage and average goals in 2012/2013
FROM (SELECT stage, AVG(home_goal + away_goal) AS avg_goal
		FROM match
		GROUP BY stage) AS s
```

**Task 2:** Add a subquery to the `WHERE` clause that calculates the overall average total goals.
```sql
-- Select the stage and average goals in 2012/2013
SELECT stage, AVG(home_goal + away_goal)
FROM match
WHERE season = '2012/2013
GROUP BY stage
```

**Task 3:** Filter the main query for stages where the average total goals is **higher than** the overall average.
```sql
-- Filter the main query using the subquery
WHERE s.avg_goal > (SELECT stage, AVG(home_goal + away_goal)
					FROM match
					WHERE season = '2012/2013'
					GROUP BY stage)
```

**Task 4:** Select the `stage` and `avg_goals` columns from the `s` subquery into the main query.
```sql
-- Select the stage and average goals from the subquery
SELECT stage, avg_goals
```

**Final query**
```sql
SELECT stage, ROUND(avg_goals,2) AS avg_goals
FROM 
    (SELECT stage, AVG(home_goal + away_goal) AS avg_goals
     FROM match
     WHERE season = '2012/2013'
     GROUP BY stage) AS s
WHERE s.avg_goals > (SELECT AVG(home_goal + away_goal) 
                    FROM match WHERE season = '2012/2013');
```
