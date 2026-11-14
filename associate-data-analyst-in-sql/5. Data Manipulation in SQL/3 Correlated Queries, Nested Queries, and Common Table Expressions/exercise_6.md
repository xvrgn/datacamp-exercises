## Organizing with CTEs

Previously, you modified a query based on a statement you completed in chapter 2 using common table expressions.

This time, let's expand on the exercise by looking at details about matches with very high scores using CTEs. Just like a subquery in `FROM`, you can join tables _inside_ a CTE.

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task 1:** Declare your CTE, where you create a list of all matches with the league `name`.
```sql
-- Set up your CTE
WITH match_list AS ()
```

**Task 2:** Select the `league`, `date`, `home`, and `away` goals **from** the CTE.
```SQL
WITH match_list AS (
	SELECT l.name AS league, m.date, m.home_goal, m.away_goal, 
		(home_goal + away_goal) AS total_goals
	FROM match m
	LEFT JOIN league l
	ON m.country_id = l.id
)
```

**Task 2:** Filter the main query for matches with **10 or more** goals.
```sql
WHERE total_goals >= 10
```

**Final Query**
```SQL
WITH match_list AS (
    SELECT l.name AS league, m.date, m.home_goal, m.away_goal,
		(m.home_goal + m.away_goal) AS total_goals
    FROM match AS m
    LEFT JOIN league as l 
    ON m.country_id = l.id
)

SELECT league, date, home_goal, away_goal
FROM match_list
WHERE total_goals >= 10;
```