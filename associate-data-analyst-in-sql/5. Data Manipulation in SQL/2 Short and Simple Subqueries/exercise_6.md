## Add a subquery to the SELECT clause
Subqueries in `SELECT` statements generate a single value that allow you to pass an aggregate value down a data frame. This is useful for performing calculations on data within your database.

In the following exercise, you will construct a query that calculates the average number of goals per match in each country's league.

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task 1:** In the subquery, Select the average total goals by **adding** `home_goal` and `away_goal`, then
```sql
 -- Select and round the average total goals for the season
SELECT ROUND(AVG(home_goal + away_goal),2)
FROM match
```

**Task 2:** Filter the results so that only the average of goals in the `'2013/2014'` season is calculated.
```sql
SELECT ROUND(AVG(home_goal + away_goal),2)
FROM match
WHERE season = '2013/2014'
```

**Task 3:**  In the main query, select the average total goals by adding `home_goal` and `away_goal`. This calculates the average goals for each league, then
```sql
-- Round the average of the league's total goals
SELECT ROUND(AVG(home_goal + away_goal),2) AS avg_goals
```

-**Task 4:** Filter the results in the main query the same way you filtered the subquery. `GROUP` the query `BY` the league `name`.
```sql
-- Filter for the 2013/2014 season
WHERE season = '2013/2014'
GROUP BY l.name
```

**Final Query**
```sql
SELECT 
    l.name AS league,
    ROUND(AVG(m.home_goal+ m.away_goal), 2) AS avg_goals,
    (SELECT ROUND(AVG(home_goal + away_goal), 2) 
     FROM match
     WHERE season = '2013/2014') AS overall_avg
FROM league AS l
LEFT JOIN match AS m
ON l.country_id = m.country_id
WHERE season = '2013/2014'
GROUP BY league;
```
