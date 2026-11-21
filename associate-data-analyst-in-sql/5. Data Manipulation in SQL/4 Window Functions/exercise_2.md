## Whats OVER here
Window functions allow you to create a `RANK` of information according to any variable you want to use to sort your data. When setting this up, you will need to specify what column/calculation you want to use to calculate your rank. This is done by including an `ORDER BY` clause inside the `OVER()` clause. Below is an example:

```
SELECT 
    id,
    RANK() OVER(ORDER BY home_goal) AS rank
FROM match;
```

In this exercise, you will create a data set of ranked matches according to which leagues, on average, score the most goals in a match.

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task 1:** `SELECT` the league name and average total goals scored from `league` and `match`.
```sql
-- Select the league name and average goals scored
SELECT l.name AS league, AVG(m.home_goal + m.away_goal) AS avg_goal
```

**Task 2:** Complete the window function so it calculates the `RANK()` of average goals scored across all leagues in the database.
```sql
-- Rank each league over the average goals
RANK() OVER(ORDER BY AVG(m.home_goal + m.away_goal))  AS league_rank
```

**Task 3:** Order the rank `OVER` the average total of home and away goals scored.
```sql
-- Order the query by the rank you created
ORDER BY RANK() OVER(ORDER BY AVG(m.home_goal + m.away_goal))
```

**Final Query**
```sql
SELECT 
    l.name AS league,
    AVG(m.home_goal + m.away_goal) AS avg_goals,
    RANK() OVER(ORDER BY AVG(m.home_goal + m.away_goal)) AS league_rank
FROM league AS l
LEFT JOIN match AS m 
ON l.id = m.country_id
WHERE m.season = '2011/2012'
GROUP BY l.name
ORDER BY RANK() OVER(ORDER BY AVG(m.home_goal + m.away_goal));
```
