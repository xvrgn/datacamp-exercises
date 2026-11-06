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

-- Perform an inner join with cities as c1 and countries as c2 on country code
SELECT
    c1.name AS city,
    code,
    c2.name AS country,
    region,
    city_proper_pop
FROM cities AS c1
INNER JOIN countries c2
ON c1.country_code = c2.code
ORDER BY code DESC;

-- Join right table using left join (with alias)
SELECT
	c1.name AS city,
    code,
    c2.name AS country,
    region,
    city_proper_pop
FROM cities AS c1
LEFT JOIN countries c2
ON c1.country_code = c2.code
ORDER BY code DESC;

-- Match on code fields
-- Filter for the year 2010
SELECT country_name, region, gdp_percapita
FROM countries AS c
LEFT JOIN economies AS e
USING(code)
WHERE year = 2010;

-- Select region, and average gdp_percapita as avg_gdp and group by region
SELECT region, AVG(gdp_percapita) AS avg_gdp
FROM countries AS c
LEFT JOIN economies AS e
USING(code)
WHERE year = 2010
GROUP BY region;

-- Order by descending avg_gdp
-- Return only first 10 records
SELECT region, AVG(gdp_percapita) AS avg_gdp
FROM countries AS c
LEFT JOIN economies AS e
USING(code)
WHERE year = 2010
GROUP BY region
ORDER BY avg_gdp DESC
LIMIT 10;

-- Modify this query to use RIGHT JOIN instead of LEFT JOIN
SELECT countries.name AS country, languages.name AS language, percent
FROM countries
LEFT JOIN languages
USING(code)
ORDER BY language;

-- Join to currencies
-- Where region is North America or name is null
SELECT country_name AS country, code, region, basic_unit
FROM countries
FULL JOIN currencies
USING (code)
WHERE region = 'North America' OR region IS NULL
ORDER BY region;

-- Join to currencies
SELECT country_name AS country, code, region, basic_unit
FROM countries
LEFT JOIN currencies
USING (code)
WHERE region = 'North America'
	OR country_name IS NULL
ORDER BY region;

-- Join to currencies
SELECT country_name AS country, code, region, basic_unit
FROM countries
INNER JOIN currencies
USING (code)
WHERE region = 'North America'
	OR country_name IS NULL
ORDER BY region;

-- Full join with languages (alias as l)
-- Full join with currencies (alias as c2)
SELECT
	c1.name AS country,
    region,
    l.name AS language,
	basic_unit,
    frac_unit
FROM countries AS c1
FULL JOIN languages AS l
USING(code)
FULL JOIN currencies AS c2
USING(code)
WHERE region LIKE 'M%esia';

-- Inner join countries as c with languages as l on code
SELECT c.name AS country, l.name AS language
FROM countries AS c
INNER JOIN languages AS l
USING(code)
WHERE c.code IN ('PAK','IND')
	AND l.code in ('PAK','IND');

-- Perform a cross join to languages (alias as l)
SELECT c.name AS country, l.name AS language
FROM countries AS c
CROSS JOIN languages AS l
WHERE c.code in ('PAK','IND')
	AND l.code in ('PAK','IND');

-- Join to populations (alias as p) using an appropriate join
-- Filter for only results in the year 2010
-- Sort by life_exp
-- Limit to five records
SELECT
	c.name AS country,
    region,
    life_expectancy AS life_exp
FROM countries AS c
INNER JOIN populations AS p
ON c.code = p.country_code
WHERE year = 2010
ORDER BY life_exp
LIMIT 5;

-- Select aliased fields from populations as p1
-- Join populations as p1 to itself, alias as p2, on country code
SELECT p1.country_code, p1.size AS size2010, p2.size AS size2015
FROM populations p1
INNER JOIN populations p2
USING(country_code);

-- Filter such that p1.year is always five years before p2.year
SELECT
	p1.country_code,
    p1.size AS size2010,
    p2.size AS size2015
FROM populations AS p1
INNER JOIN populations AS p2
ON p1.country_code = p2.country_code
WHERE p1.year = 2010
    AND p1.year = p2.year - 5
