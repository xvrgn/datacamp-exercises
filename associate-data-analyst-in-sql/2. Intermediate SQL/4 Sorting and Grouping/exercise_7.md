### HAVING and sorting


#### Instructions and Solutions
##### ✅ Instruction 1/1
**Task 1:** Select the `country` and the average budget as `average_budget`, rounded to two decimal, from `films`.
```SQL
-- Select the country and average_budget from films
SELECT country, ROUND(AVG(budget),2) AS average_budget
FROM films
```

**Task 2:** Group the results by `country`.
```SQL
-- Group by country
GROUP BY country
```

**Task 3:** Filter results to countries with an average budget of more than one billion (`1000000000`).
```SQL
-- Filter to countries with an average_budget of more than one billion
HAVING AVG(budget) > 1000000000
```

**Task 4:** Sort by descending order of the `average_budget`.
```SQL
-- Order by descending order of the aggregated budget
ORDER BY average_budget DESC
```

**Final Query:**
```SQL
SELECT country, ROUND(AVG(budget),2) AS average_budget
FROM films
GROUP BY country
HAVING AVG(budget) > 1000000000
ORDER BY average_budget DESC;
```

