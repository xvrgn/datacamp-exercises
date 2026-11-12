## Subqueries in Select for Calculations
Subqueries in `SELECT` are a useful way to create calculated columns in a query. A subquery in `SELECT` can be treated as a single numeric value to use in your calculations. When writing queries in `SELECT`, it's important to remember that filtering the main query does not filter the subquery -- and vice versa.

In the previous exercise, you created a column to compare each league's average total goals to the overall average goals in the 2013/2014 season. In this exercise, you will add a column that directly compares these values by subtracting the overall average from the subquery.

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task 1:** Select the average goals scored in a match for each league in the **main query**.
```sql
-- Select the league name and average goals scored
SELECT 
	l.name AS league, 
	AVG(home_goal + away_goal) AS avg_goal
FROM league l
LEFT JOIN match m
ON l.country_id = m.country_id
GROUP BY l.name
```

**Task 2:** Select the average goals scored in a match **overall** for the `'2013/2014'` season in the **subquery**.
```sql
SELECT AVG(home_goal + away+goal)
FROM match
WHERE season = '2013/2014'
```

**Task 3:** Subtract the subquery from the average number of goals calculated for each league.
```sql
-- Subtract the overall average from the league average
AVG(home_goal + away_goal) - (
	SELECT AVG(home_goal + away+goal)
	FROM match
	WHERE season = '2013/2014') AS diff
```

**Task 4:** Filter the main query so that only games from the `'2013/2014'` season are included.
```sql
-- Only include 2013/2014 results
WHERE season = 2013.2014
```

**Final Query**
```sql
SELECT
    l.name AS league,
    ROUND(AVG(m.home_goal + m.away_goal),2) AS avg_goals,
    ROUND(AVG(m.home_goal + m.away_goal) - 
        (SELECT AVG(home_goal + away_goal)
         FROM match 
         WHERE season = '2013/2014'),2) AS diff
FROM league AS l
LEFT JOIN match AS m
ON l.country_id = m.country_id
WHERE season = '2013/2014'
GROUP BY l.name;
```

