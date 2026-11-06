## Choosing your join
Now that you're fully equipped to use joins, try a challenge problem to test your knowledge!

You will determine the names of the five countries and their respective regions with the lowest life expectancy for the year 2010. Use your knowledge about joins, filtering, sorting and limiting to create this list!

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task 1:** Complete the join of `countries AS c` with `populations as p` on code.
```sql
-- Join to populations (alias as p) using an appropriate join
FROM countries AS c
INNER JOIN populations AS p
ON c.code = p.country_code
```

**Task 2:** Filter on the year 2010.
```sql
WHERE year = 2010
```

**Task 3:** Sort your results by life expectancy in ascending order.
```sql
ORDER BY life_exp
```

**Task 4:** Limit the result to five countries.
```sql
LIMIT 5
```


**Final Query**
```sql
SELECT 
    c.name AS country,
    region,
    life_expectancy AS life_exp
FROM countries AS c
INNER JOIN populations AS p
ON c.code = p.country_code
WHERE year = 2010
ORDER BY life_exp
LIMIT 5;
```

