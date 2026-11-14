## Getting started with nested subqueries

Time to take your subqueries up a gear! You only have time to watch so much soccer, and want to know if the `England Premier League` is exciting as people say.

You'll compare the maximum number of goals scored in a single match across each season against the maximum for the `England Premier League`.
content

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task:** Complete a nested subquery to select the `country_id` for `'England Premier League'` from `league`, which will be used to filter the parent subquery.
```sql
-- Subquery to get the max goals in an 'England Premier League' match for the same season
SELECT 
    season,
    MAX(home_goal + away_goal) AS max_goals,
    (SELECT MAX(home_goal + away_goal) 
	FROM match 
	WHERE season = main.season
		AND country_id IN (
			SELECT country_id
			FROM league
			WHERE name = 'England Premier League'
	     )
	) AS pl_max_goals
FROM match AS main
GROUP BY season;
```