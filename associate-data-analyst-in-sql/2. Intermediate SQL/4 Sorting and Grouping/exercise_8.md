### All together now


#### Instructions and Solutions
##### ✅ Instruction 1/4
**Task:** Select the `release_year` for each film in the `films` table, filter for records released after 1990, and group by `release_year`.
```SQL
-- Select the release_year for films released after 1990 grouped by year
SELECT release_year
FROM films
GROUP BY release_year
HAVING release_year > 1990
```

##### ✅ Instruction 2/4
**Task:** Modify the query to include the average `budget` aliased as `avg_budget` and average `gross` aliased as `avg_gross` for the results we have so far.
```SQL
-- Modify the query to also list the average budget and average gross
SELECT 
    release_year, 
    AVG(budget) AS avg_budget, 
    AVG(gross) AS avg_Gross
FROM films
WHERE release_year > 1990
GROUP BY release_year;
```

##### ✅ Instruction 3/4
**Task:** Modify the query once more so that only years with an average budget of greater than 60 million are included.
```SQL
-- Modify the query to see only years with an avg_budget of more than 60 million
SELECT 
    release_year, 
    AVG(budget) AS avg_budget, 
    AVG(gross) AS avg_gross
FROM films
WHERE release_year > 1990
GROUP BY release_year
HAVING AVG(budget) > 60000000;
```

##### ✅ Instruction 4/4
**Task:** Finally, order the results from the highest average gross and limit to one.
```SQL
-- Order the results from highest to lowest average gross and limit to one
SELECT release_year, AVG(budget) AS avg_budget, AVG(gross) AS avg_gross
FROM films
WHERE release_year > 1990
GROUP BY release_year
HAVING AVG(budget) > 60000000
ORDER BY avg_gross DESC
LIMIT 1;
```