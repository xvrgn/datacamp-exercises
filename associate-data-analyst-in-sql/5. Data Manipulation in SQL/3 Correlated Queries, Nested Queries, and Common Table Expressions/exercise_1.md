## Getting started with correlated subqueries
Correlated subqueries are subqueries that reference one or more columns in the main query. Correlated subqueries depend on information in the main query to run, and thus, cannot be executed on their own.

Correlated subqueries are evaluated in SQL once per row of data retrieved—a process that takes a lot more computing power and time than a simple subquery.

In this exercise, you will practice using correlated subqueries to examine matches with scores that are extreme outliers for each country—above 3 times the average score!

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task 1:** Start the subquery in `WHERE` by taking the **average**/mean of the home and away goals.
```sql
-- Filter the main query by the subquery
WHERE (main.home_goal + main.away_goal) > (
	SELECT AVG((sub.home_goal + sub.away_goal) * 3)
	FROM match sub
)
```

**Task 2:** Complete the subquery column references, so that `country_id` is matched in the `main` and `sub` tables.
```sql
-- Join the main query to the subquery with country_id in WHERE
WHERE main.country_id = sub.country_id
```

**Main query**
```sql
SELECT main.country_id, main.date, main.home_goal, main.away_goal
FROM match AS main
WHERE (home_goal + away_goal) > 
	(SELECT AVG((sub.home_goal + sub.away_goal) * 3)
	FROM match AS sub
	WHERE main.country_id = sub.country_id);
```

