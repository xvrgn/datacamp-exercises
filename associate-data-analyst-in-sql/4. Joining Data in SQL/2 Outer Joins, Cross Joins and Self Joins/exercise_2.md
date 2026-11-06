## Building on your LEFT JOIN
You will use `AVG()` in combination with a `LEFT JOIN` to determine the average gross domestic product (GDP) per capita **by region** in 2010.
#### Instructions and Solutions

##### ✅ Instruction 1/3
**Task 1:** Complete the `LEFT JOIN` with the `countries` table on the left and the `economies` table on the right on the `code` field. 
```sql
-- Match on code fields
USING(code)
```

**Task 2:** Filter the records from the `year` 2010.

```sql
-- Filter for the year 2010
WHERE year = 2010;
```
##### ✅ Instruction 2/3
**Task 1:** To calculate per capita GDP per region, begin by grouping by `region`. 
```sql
-- Group by region
GROUP BY region;
```

**Task 2:** After your `GROUP BY`, choose `region` in your `SELECT` statement, followed by average GDP per capita using the `AVG()` function, with `AS avg_gdp` as your alias.
```sql
-- Select region, and average gdp_percapita as avg_gdp
SELECT region, AVG(gdp_percapita) AS avg_gdp
```

##### ✅ Instruction 3/3
**Task 1:** Order the result set by the average GDP per capita from highest to lowest
```sql
-- Order by descending avg_gdp
ORDER BY avg_gdp DESC
```

**Task 2:** return only the first 10 records in your result.
```sql
-- Return only first 10 records
LIMIT 10
```

**Final Query**
```sql
SELECT region, AVG(gdp_percapita) AS avg_gdp
FROM countries AS c
LEFT JOIN economies AS e
USING(code)
WHERE year = 2010
GROUP BY region
ORDER BY avg_gdp DESC
LIMIT 10;
```
