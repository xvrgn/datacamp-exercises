## Filtering using a subquery with a list
our goal in this exercise is to generate a list of teams that never played a game in their home city. Using a subquery, you will generate a list of unique `hometeam_ID` values from the unfiltered `match` table to _exclude_ in the `team` table's `team_api_ID` column.

In addition to filtering using a single-value (scalar) subquery, you can create a list of values in a subquery to filter data based on a complex set of conditions. This type of subquery generates a _one column reference list_ for the main query. As long as the values in your list match a column in your main query's table, you don't need to use a join -- even if the list is from a separate table.

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task 1:** Create a subquery in the WHERE clause that retrieves all unique `hometeam_id` values from the match table. 
```sql
SELECT DISTINCT hometeam_id
FROM match
```

**Task 2:** Select the `team_long_name` and `team_short_name` from the team table. Exclude all values from the subquery in the main query.
```sql
-- Select the team long and short names
SELECT team_long_name, team_short_name
FROM team
-- Exclude all values from the subquery
WHERE team_api_id NOT IN (
	SELECT DISTINCT hometeam_id
	FROM match
);
```