## Correlated subquery with multiple conditions
Correlated subqueries are useful for matching data across multiple columns. In the previous exercise, you generated a list of matches with extremely high scores for each country. In this exercise, you're going to add an additional column for matching to answer the question—what was the highest scoring match for each country, in each season?

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task 1:** Complete the subquery to select the matches with the **highest** number of **total** goals.
```sql
-- Filter for matches with the maximum number of total goals scored
WHERE (home_goal + away_goal) =
		(SELECT MAX(sub.home_goal + sub.away_goal)
		FROM match AS sub)
```

**Task 2:** Match the subquery to the main query using the `country_id` and `season` columns in both tables.\
```sql
-- Join the main query to the subquery in WHERE
WHERE main.country_id = sub.country_id 
	AND main.season = sub.season
```

**Main query**
```sql
SELECT main.country_id, main.date, main.home_goal, main.away_goal
FROM match AS main
WHERE (home_goal + away_goal) = (
	SELECT MAX(sub.home_goal + sub.away_goal)
	FROM match AS sub
	WHERE main.country_id = sub.country_id
		AND main.season = sub.season);
```