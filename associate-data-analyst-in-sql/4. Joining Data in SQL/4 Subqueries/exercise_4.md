## WHERE do people live?
In this exercise, you will strengthen your knowledge of subquerying by identifying capital cities in order of largest to smallest population.

Follow the instructions below to get the urban area population for capital cities only. You'll use the `countries` and `cities` tables displayed in the console to help identify columns of interest as you build your query.

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task:** Return the `name`, `country_code` and `urbanarea_pop` for all _capital_ cities (not aliased).
```sql
-- Select relevant fields from cities table
SELECT name, country_code, urbanarea_pop
FROM cities
-- Filter using a subquery on the countries table
WHERE name IN (
    SELECT capital
    FROM countries)
ORDER BY urbanarea_pop DESC;
```