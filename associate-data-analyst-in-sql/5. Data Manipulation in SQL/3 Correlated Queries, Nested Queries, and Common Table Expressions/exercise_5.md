## Clean up with CTEs

In chapter 2, you generated a list of countries and the number of matches in each country with more than 10 total goals. The query in that exercise utilized a subquery in the `FROM` statement in order to filter the matches _before_ counting them in the main query. Below is the query you created:

```
SELECT
  c.name AS country,
  COUNT(sub.id) AS matches
FROM country AS c
INNER JOIN (
  SELECT country_id, id 
  FROM match
  WHERE (home_goal + away_goal) >= 10) AS sub
ON c.id = sub.country_id
GROUP BY country;
```

You can list one (or more) subqueries as **common table expressions** (CTEs) by _declaring_ them ahead of your main query, which is an excellent tool for organizing information and placing it in a logical order.

In this exercise, let's rewrite a similar query using a CTE.

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task 1:** Complete the syntax to **declare** your CTE. Select the `country_id` and match `id` from the `match` table in your CTE.
```sql
-- Set up your CTE
WITH match_list AS (
	SELECT country_id, id
	FROM match
	WHERE (home_goal + away_goal) >= 10
)
```

**Task 2:**  `LEFT JOIN` the CTE to the league table using `country_id`. 
```sql
-- Join the CTE to the league table using country_id
FROM league l
LEFT JOIN match_list m
ON m.country_id = l.id
```

**Final Query**
```sql
WITH match_list AS (
    SELECT country_id, id
    FROM match
    WHERE (home_goal + away_goal) >= 10
)

SELECT l.name AS league, COUNT(match_list.id) AS matches
FROM league AS l
LEFT JOIN match_list ON l.id = match_list.country_id
GROUP BY l.name;
```

