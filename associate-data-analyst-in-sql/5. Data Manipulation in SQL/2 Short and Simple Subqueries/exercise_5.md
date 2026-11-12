## Building on Subqueries in FROM
In the previous exercise, you found that England, Netherlands, Germany and Spain were the only countries that had matches in the database where 10 or more goals were scored overall. Let's find out some more details about those matches -- when they were played, during which seasons, and how many of the goals were home versus away goals.

You'll notice that in this exercise, the table alias is excluded for every column selected in the main query. This is because the _main query_ is extracting data from the _subquery_, which is treated as a _single table_.

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task 1:** Complete the **subquery** inside the `FROM` clause. Select the country `name` from the `country` table, along with the `date`, the `home_goal`, the `away_goal`, and the `total_goals` columns from the `match` table.
```sql
SELECT name AS country, 
	m.date, 
	m.home_goal, 
	m.away_goal,
	(m.home_goal + m.away_goal) AS total_goals
FROM match m
```

**Task 2:** Create a column in the **subquery** that adds home and away goals, called `total_goals`. This will be used to filter the main query.
```sql
(m.home_goal + m.away_goal) AS total_goals
```

**Task 3:** Select the `country`, `date`, `home_goal`, and `away_goal` in the **main** query.
```sql
-- Select country, date, home, and away goals from the subquery
SELECT
    country,
    date,
    home_goal,
    away_goal
```

**Task 4:** Filter the main query for games with **10 or more** total goals.
```sql
-- Filter by total goals scored in the main query
WHERE total_goal >= 10
```

**Final query**
```sql
SELECT country, date, home_goal, away_goal
FROM (SELECT name AS country, 
		m.date, 
		m.home_goal, 
		m.away_goal,
		(m.home_goal + m.away_goal) AS total_goals
	  FROM match AS m
	  LEFT JOIN country AS c
	  ON m.country_id = c.id) AS subq
WHERE total_goals >= 10;
```