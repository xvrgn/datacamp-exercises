## Final challenge
You've made it to the final challenge problem! Get ready to tackle this step-by-step.

Your task is to determine the top 10 capital cities in Europe and the Americas by `city_perc`, a metric you'll calculate. `city_perc` is a percentage that calculates the "proper" population in a city as a percentage of the total population in the wider metro area, as follows:

`city_proper_pop / metroarea_pop * 100`

Do **not** use table aliasing in this exercise.

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task 1:** From `cities`, select the city name, country code, proper population, and metro area population, as well as the field `city_perc`, which calculates the proper population as a percentage of metro area population for each city (using the formula provided).
```sql
-- Select fields from cities
SELECT 
    name, 
    country_code, 
    city_proper_pop, 
    metroarea_pop,
    (city_proper_pop / metroarea_pop * 100) AS city_perc
FROM cities
```

**Task 2:** Filter city name with a subquery that selects `capital` cities from `countries` in `'Europe'` or continents with `'America'` at the end of their name.
```sql
-- Use subquery to filter city name
WHERE name IN (
    SELECT capital
    FROM countries
    WHERE continent = 'Europe' 
        OR  continent LIKE '%America'
)
```

**Task 3:** Exclude `NULL` values in `metroarea_pop`.
```sql
-- Add filter condition such that metroarea_pop does not have null values
AND metroarea_pop IS NOT NULL
```

**Task 4:** Order by `city_perc` (descending) and return only the first 10 rows
```sql
-- Sort and limit the result
ORDER BY city_perc DESC
LIMIT 10;
```

**Final Query**
```sql
SELECT 
    name, 
    country_code, 
    city_proper_pop, 
    metroarea_pop,
    (city_proper_pop / metroarea_pop * 100) AS city_perc
FROM cities
WHERE name IN (
    SELECT capital
    FROM countries
    WHERE continent = 'Europe' 
        OR  continent LIKE '%America'
)
AND metroarea_pop IS NOT NULL
ORDER BY city_perc DESC
LIMIT 10;
```