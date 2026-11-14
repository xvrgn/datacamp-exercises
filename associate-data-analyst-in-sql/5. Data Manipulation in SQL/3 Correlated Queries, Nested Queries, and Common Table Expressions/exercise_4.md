# Nest a subquery in FROM

**_What's the average number of matches per season where a team scored 5 or more goals? How does this differ by country?_**

Let's use a nested, correlated subquery to perform this operation. In the real world, you will probably find that nesting multiple subqueries is a task you don't have to perform often. In some cases, however, you may find yourself struggling to properly group by the column you want, or to calculate information requiring multiple mathematical transformations (i.e., an `AVG` of a `COUNT`).

Nesting subqueries and performing your transformations one step at a time, adding it to a subquery, and then performing the next set of transformations is often the easiest way to yield accurate information about your data. Let's get to it!

#### Instructions and Solutions

##### ✅ Instruction 1/3
**Task:** Generate a list of matches where **_at least one team_** scored **_5 or more goals_**.
```sql
SELECT country_id, season, id
FROM match
WHERE home_goal >= 5 OR away_goal >= 5
```
##### ✅ Instruction 2/3
**Task:** Turn the query from the previous step into a _subquery_ in the `FROM` statement. Then `COUNT` the `match` table `id`s generated in the previous step.
```sql
SELECT country_id, season, COUNT(id) AS matches
FROM (
	SELECT country_id, season, id
	FROM match
	WHERE home_goal >= 5 OR away_goal >= 5
) AS subquery
GROUP BY country_id, season
```

##### ✅ Instruction 3/3

**Task: 1** Finally, declare the same query from step 2 as a subquery in `FROM` with the alias `outer_s`.
```sql
-- Close parentheses and alias the subquery
(SELECT country_id, season, COUNT(id) AS matches
FROM (
	SELECT country_id, season, id
	FROM match
	WHERE home_goal >= 5 OR away_goal >= 5) AS inner_s
GROUP BY country_id, season) AS outer_s
```

**Task: 2** Left join it to the `country` table using the outer query's `country_id` column.
```sql
-- Left join outer_s to country
LEFT JOIN (
	SELECT country_id, season, COUNT(id) AS matches
	FROM (
	    SELECT country_id, season, id
		FROM match
		WHERE home_goal >= 5 OR away_goal >= 5) AS inner_s
	GROUP BY country_id, season) AS outer_s
ON c.id = outer_s.country_id
```

**Task: 3** Calculate an `AVG` of high scoring `matches` per country in the main query.
```sql
AVG(outer_s.matches) AS avg_seasonal_high_scores
```

**Final query**
```sql
SELECT c.name AS country, AVG(outer_s.matches) AS avg_seasonal_high_scores
FROM country AS c
LEFT JOIN (
	SELECT country_id, season, COUNT(id) AS matches
	FROM (
	    SELECT country_id, season, id
	    FROM match
	    WHERE home_goal >= 5 OR away_goal >= 5) AS inner_s
	GROUP BY country_id, season) AS outer_s
ON c.id = outer_s.country_id
GROUP BY country;
```