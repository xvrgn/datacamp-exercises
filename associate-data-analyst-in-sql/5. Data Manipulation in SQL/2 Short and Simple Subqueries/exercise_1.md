## Filtering using scalar subqueries
Subqueries are incredibly powerful for performing complex filters and transformations. You can filter data based on single (scalar) values using a subquery in ways you cannot by using `WHERE` statements or joins. Subqueries can also be used for more advanced manipulation of your dataset. You will likely encounter subqueries in any real-world setting that uses relational databases.

In this exercise, you will generate a list of matches where the total goals scored (for both teams in total) is more than _3 times_ the average for games in the `matches_2013_2014` table, which includes all games played in the 2013/2014 season.

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task 1:** Calculate triple the average home + away goals scored across all matches in a subquery.
```sql
SELECT 3 * AVG(home_goal+away_goal)
FROM match
```

**Task 2:** Filter the main query for matches where the total goals (home + away goals) exceed the value in the subquery.
```sql
WHERE (home_goal + away_goal) > (
	SELECT 3 * AVG(home_goal+away_goal)
	FROM match
);
```

**Final Query**
```sql
SELECT date, home_goal, away_goal
FROM match
WHERE (home_goal + away_goal) > (
	SELECT 3 * AVG(home_goal+away_goal)
	FROM match
);
```