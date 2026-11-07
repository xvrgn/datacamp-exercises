## Subquery inside WHERE
In this exercise, you will nest a subquery from the `populations` table inside another query from the same table, `populations`. Your goal is to figure out which countries had high average life expectancies in 2015.

You can use SQL to do calculations for you. Suppose you only want records from `2015` with `life_expectancy` _above_ `1.15 * avg_life_expectancy`. You could use the following SQL query.

```SQL
SELECT *
FROM populations
WHERE life_expectancy > 1.15 * avg_life_expectancy
  AND year = 2015;
```

In the first step, you'll write a query to calculate a value for `avg_life_expectancy`. In the second step, you will nest this calculation into another query.

#### Instructions and Solutions

##### ✅ Instruction 1/2
**Task 1:** Begin by calculating the average life expectancy from the `populations` table.
```SQL
-- Select average life_expectancy from the populations table
SELECT AVG(life_expectancy)
FROM populations
```

**Task 2:** Filter your answer to use records from `2015` only.
```SQL
-- Filter for the year 2015
SELECT AVG(life_expectancy)
FROM populations
WHERE year = 2015;
```

##### ✅ Instruction 2/2
**Task:** The answer from your query has now been nested into another query; use this calculation to filter `populations` for all records where `life_expectancy` is `1.15` times higher than average.
```SQL
SELECT *
FROM populations
WHERE year = 2015
-- Filter for only those populations where life expectancy is 1.15 times higher than average
  AND life_expectancy > 1.15 *
  (SELECT AVG(life_expectancy)
   FROM populations
   WHERE year = 2015);
```

