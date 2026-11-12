## ALL the subqueries EVERYWHERE
In soccer leagues, games are played at different _stages_. Winning teams progress from one stage to the next, until they reach the final stage. In each stage, the stakes become higher than the previous one. The `match` table includes data about the different stages that each match took place in.

Across the next 3 exercises, you will build one query with a subquery in each of the `SELECT`, `FROM`, and `WHERE` clauses. Does the average number of goals scored change as the stakes get higher from one stage to the next?

The query repeats one subquery so you can practice each placement. Every copy reads the `match` table again, so in your own work you'd calculate the overall average once, as Chapter 4 shows with a window function.

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task 1:** Extract the average number of total goals in a `SELECT` subquery.
```sql
-- Select the stage and average goals for each stage
SELECT AVG(home_goal + away_goal)
FROM match
```

**Task 2:** Calculate the **average** total goals for the specific `stage` in the main query.
```sql
 -- Select the average overall goals for the 2012/2013 season
SELECT stage, AVG(home_goal + away_goal)
FROM match
```

**Task 3:** Filter both subqueries and the main query so that only data from the **2012/2013** season is included.
```sql
-- Filter for the 2012/2013 season
WHERE season = '2012/2013'
```

**Task 4:** `GROUP` the query by the `m.stage` column.
```sql
-- Group by stage
GROUP BY stage
```

**Final query**
```sql
SELECT 
	m.stage,
    ROUND(AVG(m.home_goal + m.away_goal),2) AS avg_goals,
    ROUND((SELECT AVG(home_goal + away_goal) 
           FROM match 
           WHERE season = '2012/2013'),2) AS overall
FROM match AS m
WHERE season = '2012/2013'
GROUP BY m.stage;
```

