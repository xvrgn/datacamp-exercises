## Joining Subqueries in FROM
The `match` table in the European Soccer Database does not contain country or team names. You can get this information by joining it to the `country` table, and use this to aggregate information, such as the number of matches played in each country.

If you're interested in filtering data from one of these tables, you can also create a subquery from one of the tables, and then join it to an existing table in the database. A subquery in `FROM` is an effective way of answering detailed questions that requires filtering or transforming data before including it in your final results.

Your goal in this exercise is to generate a subquery using the `match` table, and then join that subquery to the `country` table to calculate information about matches with 10 or more goals in total!

#### Instructions and Solutions

##### ✅ Instruction 1/2
**Task 1:** Create the subquery to be used in the next step, which selects the country ID and match ID (`id`) from the `match` table.
```sql
-- select the country id and match id
SELECT country_id, id
FROM match
```

**Task 2:** Filter the query for matches with greater than or equal to 10 goals.
```sql
WHERE (home_goal + away_goal >= 10)
```

##### ✅ Instruction 1/2
**Task 1:** Construct a **subquery** that selects only matches with **10 or more total** goals.
```sql
-- Filter the subquery by matches with 10+ goals
(SELECT country_id, id 
FROM match
WHERE (home_goal + away_goal) >= 10) AS sub
```

**Task 2:**  `INNER JOIN` the subquery onto `country` in the main query.
```sql
-- Inner join the subquery onto country
FROM country c
INNER JOIN (SELECT country_id, id 
		FROM match
		WHERE (home_goal + away_goal) >= 10) AS 
ON c.id = sub.country_id
```

**Task 3:**  Select `name` from `country` and `COUNT()` the `id` column from `match`.
```sql
-- Select country name and the count match IDs
SELECT
    c.name AS country_name,
    COUNT(sub.id) AS matches
FROM country AS c
INNER JOIN (SELECT country_id, id 
           FROM match
           WHERE (home_goal + away_goal) >= 10) AS sub
ON c.id = sub.country_id
GROUP BY country_name;
```

