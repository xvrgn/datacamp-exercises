-- Query the sum of film durations
SELECT SUM(duration) AS total_duration
FROM films;

-- Calculate the average duration of all films
SELECT AVG(duration) AS average_duration
FROM films;

-- Find the latest release_year
SELECT MAX(release_year) AS latest_year
FROM films;

-- Find the duration of the shortest film
SELECT MIN(release_year) AS shortest_film
FROM films;

-- Calculate the sum of gross from the year 2000 or later
SELECT SUM(gross) AS total_gross
FROM films
WHERE release_year >= 2000;

-- Calculate the average gross of films that start with A
SELECT AVG(gross) avg_gross_A
FROM films
WHERE title LIKE 'A%';

-- Calculate the lowest gross film in 1994
SELECT MIN(gross) AS lowest_gross
FROM films
WHERE release_year = 1994;

-- Calculate the highest gross film released between 2000-2012
SELECT MAX(gross) AS highest_gross
FROM films
WHERE release_year BETWEEN 2000 AND 2012;

-- Calculate the average budget rounded to the thousands
SELECT ROUND(AVG(budget),-3) as avg_budget_thousands
FROM films;

-- Calculate the title and duration_hours from films
SELECT title, (duration/60.0) AS duration_hours
FROM films;

-- Calculate the percentage of people who are no longer alive
SELECT COUNT(death_date) * 100.0 / COUNT(*) AS percentage_dead
FROM people;

-- Find the number of decades in the films table
SELECT (MAX(release_year) - MIN(release_year)) / 10.0 AS number_of_decades
FROM films;

-- Round duration_hours to two decimal places
SELECT title, ROUND(duration / 60.0, 2) AS duration_hours
FROM films;


