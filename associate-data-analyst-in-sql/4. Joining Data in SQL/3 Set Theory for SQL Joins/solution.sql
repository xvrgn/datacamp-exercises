-- A SQL error, because languages and currencies do not have the same number of fields
SELECT *
FROM languages
UNION
SELECT *
FROM currencies;

-- An unordered list of each country code in languages and currencies, including duplicates
SELECT code FROM
languages
UNION ALL
SELECT code FROM
currencies;

-- A SQL error, because code and curr_id are not of the same data type
SELECT code
FROM languages
UNION
SELECT curr_id
FROM currencies;

-- Select all fields from economies2015
SELECT *
FROM economies2015
UNION
-- Select all fields from economies2019
SELECT *
FROM economies2019
ORDER BY code, year;

-- Query that determines all pairs of code and year from economies and populations, without duplicates
SELECT code, year
FROM economies
UNION
SELECT country_code, year
FROM populations
ORDER BY code, year;

-- Set theory clause
SELECT code, year
FROM economies
UNION ALL
SELECT country_code, year
FROM populations
ORDER BY code, year;

-- Return all cities with the same name as a country
SELECT name
FROM cities
INTERSECT
SELECT country_name
FROM countries;

-- Return all cities that do not have the same name as a country
SELECT  name
FROM cities
EXCEPT
SELECT country_name
FROM countries
ORDER BY name;

