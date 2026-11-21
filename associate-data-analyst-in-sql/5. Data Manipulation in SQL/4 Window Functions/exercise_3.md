## Flip OVER your results

In the last exercise, the rank generated in your query was organized from smallest to largest. By adding `DESC` to your window function, you can create a rank sorted from largest to smallest.

```
SELECT 
    id,
    RANK() OVER(ORDER BY home_goal DESC) AS rank
FROM match;
```

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task 1:** Select the league `name` and **average total** goals scored from `league` and `match`.
```sql
-- Select the league name and average goals scored
SELECT l.name AS league, AVG(m.home_goal + m.away_goal) AS avg_goals
```

**Task 2:**  Complete the window function to rank each league from **highest to lowest** average goals scored.
```sql
-- Rank leagues in descending order by average goals
RANK() 0VER(ORDER BY AVG(m.home_goal + m.away_goal) DESC) AS league_rank
```

**Task 3:** `ORDER` the main query `BY` the rank you just **created**.
```sql
-- Order the query by the rank you created
ORDER BY AVG(m.home_goal + m.away_goal)
```

**Final Query**
```sql
SELECT 
    l.name AS league,
    AVG(m.home_goal + m.away_goal) AS avg_goals,
    RANK() OVER(ORDER BY AVG(m.home_goal + m.away_goal) DESC) AS league_rank
FROM league AS l
LEFT JOIN match AS m 
ON l.id = m.country_id
WHERE m.season = '2011/2012'
GROUP BY l.name
ORDER BY AVG(m.home_goal + m.away_goal);
```
