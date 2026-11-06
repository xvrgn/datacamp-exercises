## Comparing two set operations
You learned in the video exercise that `UNION ALL` returns duplicates, whereas `UNION` does not. In this exercise, you will dive deeper into this, looking at cases for when `UNION` is appropriate compared to `UNION ALL`.

You will be looking at combinations of country code and year from the `economies` and `populations` tables.

#### Instructions and Solutions

##### ✅ Instruction 1/2
**Task:** Perform a set operation that determines all pairs of country code and year (in that order) from `economies` and `populations`, excluding duplicates. Order by country code and year.
```sql
-- Query that determines all pairs of code and year from economies and populations, without duplicates
SELECT code, year
FROM economies
UNION
SELECT country_code, year
FROM populations
ORDER BY code, year
```

##### ✅ Instruction 2/2
**Task:** Amend the query to return all combinations (including duplicates) of country `code` and `year` in the `economies` or the `populations` tables.
```sql
SELECT code, year
FROM economies
UNION ALL
SELECT country_code, year
FROM populations
ORDER BY code, year;
```

