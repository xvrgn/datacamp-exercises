-- return all rows and columns to see the content of the table
SELECT *
FROM reviews;

SELECT *
FROM films;

SELECT *
FROM people;

SELECT *
FROM roles;

-- count the number of records containing a film_id
SELECT COUNT(film_id) AS count_film_id
FROM reviews;

-- Count the number of records in the people table
SELECT COUNT(*) AS count_records
FROM people;

-- Count the number of birthdates in the people table
SELECT COUNT(birthdate) AS count_birthdate
FROM people

-- Count the records for languages and countries represented in the films table
SELECT
    COUNT(language) AS count_languages,
    COUNT(country) AS count_countries
FROM films;

-- Return the unique countries from the films table
SELECT DISTINCT country
FROM films;

-- Count the distinct countries from the films table
SELECT COUNT(DISTINCT country) AS count_distinct_countries
FROM films;

-- Debug this code
SELECT certification
FROM films
LIMIT 5; -- fixes typographical error

-- Debug this code
SELECT film_id, imdb_score, num_votes
FROM reviews; -- fixes missing commas

-- Debug this code
SELECT COUNT(birthdate) AS count_birthdays
FROM people;  -- fixes typographical error on table name and function

-- Rewrite this query
SELECT person_id, roles
FROM roles
LIMIT 10;   -- created new lines, capitalized keywords and added semicolon
