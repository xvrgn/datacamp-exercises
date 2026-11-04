### GROUP BY multiple fields
`GROUP BY` becomes more powerful when used across multiple fields or combined with `ORDER BY` and `LIMIT`.

Perhaps you're interested in learning about budget changes throughout the years in individual countries. You'll use grouping in this exercise to look at the maximum budget for each country in each year there is data available.

#### Instructions and Solutions
##### ✅ Instruction 1/1
**Task:** Select the `release_year`, `country`, and the maximum `budget` aliased as `max_budget` for each year and each country; sort your results by `release_year` and `country`.
```SQL
-- Find the release_year, country, and max_budget, then group and order by release_year and country
SELECT release_year, country, MAX(budget) AS max_budget
FROM films
GROUP BY release_year, country
ORDER BY release_year, country;
```