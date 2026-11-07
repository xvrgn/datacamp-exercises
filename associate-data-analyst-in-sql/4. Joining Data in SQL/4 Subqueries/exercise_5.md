## Subquery inside SELECT
In this exercise, you'll go further in exploring how some queries can be written using either a join or a subquery.

In Step 1, you'll begin with a `LEFT JOIN` combined with a `GROUP BY` to select the nine countries with the most cities appearing in the `cities` table, along with the counts of these cities. In Step 2, you'll write a query that returns the same result as the join, but leveraging a nested query instead.

#### Instructions and Solutions

##### ✅ Instruction 1/2
**Task 1:** Write a `LEFT JOIN` with `countries` on the left and the `cities` on the right, joining on country code.
```sql
FROM countries
LEFT JOIN cities
ON countries.code = cities.country_code
```

**Task 2:** In the `SELECT` statement of your join, include country names as `country`, and count the cities in each country, aliased as `cities_num`.
```sql
SELECT 
    countries.name AS country, 
    COUNT(cities.name) AS cities_num
...
GROUP BY country
```

**Task 3:** Sort by `cities_num` (descending), and `country` (ascending), limiting to the first nine records.
```sql
-- Find top nine countries with the most cities
SELECT 
    countries.name AS country, 
    COUNT(cities.name) AS cities_num
FROM countries
LEFT JOIN cities
ON countries.code = cities.country_code
GROUP BY country
-- Order by count of cities as cities_num
ORDER BY cities_num DESC, country
-- Limit the results
limit 9
```

##### ✅ Instruction 2/2
**Task:** - Complete the subquery to return a result equivalent to your `LEFT JOIN`, counting all cities in the `cities` table as `cities_num`. Use the `WHERE` clause to enable the correct country codes to be matched in the `cities` and `countries` columns.
```sql
-- Subquery that provides the count of cities 
SELECT countries.name AS country,  
  (SELECT COUNT(name)
   FROM cities
   WHERE countries.code = cities.country_code) AS cities_num
FROM countries
ORDER BY cities_num DESC, country
LIMIT 9;
```

