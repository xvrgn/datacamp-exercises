### Practice with aggregate functions
Now let's try extracting summary information from a table using these new aggregate functions. Summarizing is helpful in real life when extracting top-line details from your dataset. Perhaps you'd like to know how old the oldest film in the films table is, what the most expensive film is, or how many films you have listed.

Now it's your turn to get more insights about the `films` table!

#### Instructions and Solutions
##### ✅ Instruction 1/4
**Task:** Use the `SUM()` function to calculate the total `duration` of all films and alias with `total_duration`.
```sql
-- Query the sum of film durations
SELECT SUM(duration) AS total_duration
FROM films;
```

##### ✅ Instruction 2/4
**Task:** Calculate the average duration of all films and alias with `average_duration`.
```sql
-- Calculate the average duration of all films
SELECT AVG(duration) AS average_duration
FROM films;
```

##### ✅ Instruction 3/4
**Task:** Find the most recent `release_year` in the `films` table, aliasing as `latest_year`.
```sql
-- Find the latest release_year
SELECT MAX(release_year) AS latest_year
FROM films;
```

##### ✅ Instruction 4/4
**Task:** Find the `duration` of the shortest film and use the alias `shortest_film`.
```sql
-- Find the duration of the shortest film
SELECT MIN(duration) AS shortest_film
FROM films;
```