-- Select all columns from cities
-- Inner join to countries
-- Match on country codes
-- Select name fields (with alias) and region
SELECT
    cities.name AS city,
    countries.country_name AS country,
    region
FROM cities
INNER JOIN countries
ON cities.country_code = countries.code;

-- Select fields with aliases
-- Join to economies (alias e)
-- Match on code field using table aliases
SELECT c.code AS country_code, country_name, year, inflation_rate
FROM countries AS c
INNER JOIN economies e
ON c.code = e.code;

-- Match USING the code column
SELECT c.country_name AS country, l.name AS language, official
FROM countries AS c
INNER JOIN languages AS l
USING(code);

-- Select relevant fields
SELECT name, fertility_rate
FROM countries c
-- Inner join countries and populations, aliased, on code
INNER JOIN populations p
ON c.code = p.country_code;

-- Select fields
SELECT name, e.year, fertility_rate, unemployment_rate
FROM countries AS c
INNER JOIN populations AS p
ON c.code = p.country_code
-- Join to economies (as e)
INNER JOIN economies e
-- Match on country code
ON p.country_code = e.code;


-- Add an additional joining condition such that you are also joining on year
SELECT country_name, e.year, fertility_rate, unemployment_rate
FROM countries AS c
INNER JOIN populations AS p
ON c.code = p.country_code
INNER JOIN economies AS e
ON c.code = e.code
	AND p.year = e.year;

