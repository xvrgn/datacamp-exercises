-- Select country code for countries in the Middle East
SELECT code
FROM countries
WHERE region = 'Middle East';

-- Select unique language names
-- Order by the name of the language
SELECT DISTINCT name
FROM languages
ORDER BY name;

-- Add syntax to use bracketed subquery below as a filter
SELECT DISTINCT name
FROM languages
WHERE code IN
    (SELECT code
    FROM countries
    WHERE region = 'Middle East')
ORDER BY name;

-- Select code and name of countries from Oceania
SELECT code, country_name
FROM countries
WHERE continent = 'Oceania';

-- return every country code that is not included in the currencies table
SELECT code, country_name
FROM countries
WHERE continent = 'Oceania'
  AND code NOT IN
    (SELECT code
    FROM currencies);

-- Select average life_expectancy from the populations table
-- Filter for the year 2015
SELECT AVG(life_expectancy)
FROM populations
WHERE year = 2015;

-- Filter for only those populations where life expectancy is 1.15 times higher than average
SELECT *
FROM populations
WHERE year = 2015
  AND life_expectancy > 1.15 *
  (SELECT AVG(life_expectancy)
   FROM populations
   WHERE year = 2015);

-- Select relevant fields from cities table
-- Filter using a subquery on the countries table
SELECT name, country_code, urbanarea_pop
FROM cities
WHERE name IN (
    SELECT capital
    FROM countries)
ORDER BY urbanarea_pop DESC;

-- Find top nine countries with the most cities
-- Order by count of cities as cities_num
-- Limit the results
SELECT
    countries.name AS country,
    COUNT(cities.name) AS cities_num
FROM countries
LEFT JOIN cities
ON countries.code = cities.country_code
GROUP BY country
ORDER BY cities_num DESC, country
limit 9;

-- Subquery that provides the count of cities
SELECT countries.name AS country,
  (SELECT COUNT(name)
   FROM cities
   WHERE countries.code = cities.country_code) AS cities_num
FROM countries
ORDER BY cities_num DESC, country
LIMIT 9;

-- Select code, and language count as lang_num
SELECT code, COUNT(name) AS lang_num
FROM languages
GROUP BY code;

-- Select local_name and lang_num from appropriate tables
-- Where codes match
SELECT local_name, sub.lang_num
FROM countries,
  (SELECT code, COUNT(*) AS lang_num
  FROM languages
  GROUP BY code) AS sub
WHERE countries.code = sub.code
ORDER BY lang_num DESC;

-- Select relevant fields
-- Subquery returning country codes filtered on gov_form
SELECT code, inflation_rate, unemployment_rate
FROM economies
WHERE year = 2015
  AND code IN
  (SELECT code
  FROM countries
  WHERE gov_form LIKE '%Republic%' OR gov_form LIKE '%Monarchy%')
ORDER BY inflation_rate;

-- Select fields from cities
-- Use subquery to filter city name
-- Add filter condition such that metroarea_pop does not have null values
-- Sort and limit the result
SELECT
    name,
    country_code,
    city_proper_pop,
    metroarea_pop,
    (city_proper_pop/metroarea_pop * 100) AS city_perc
FROM cities
WHERE name IN (
    SELECT capital
    FROM countries
    WHERE continent = 'Europe'
        OR continent LIKE '%America'
) AND metroarea_pop IS NOT NULL
ORDER BY city_perc DESC
LIMIT 10;