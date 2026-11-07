## # Diagnosing problems using anti join
Say you are interested in identifying currencies of Oceanian countries. You have written the following `INNER JOIN`, which returns 15 records. Now, you want to ensure that all Oceanian countries from the `countries` table are included in this result. You'll do this in the first step.

```SQL
SELECT c1.code, name, basic_unit AS currency
FROM countries AS c1
INNER JOIN currencies AS c2
ON c1.code = c2.code
WHERE c1.continent = 'Oceania';
```

If there are any Oceanian countries excluded in this `INNER JOIN`, you want to return the names of these countries. You'll write an anti join to this in the second step!

#### Instructions and Solutions

##### ✅ Instruction 1/2
**Task:** Begin by writing a query to return the `code` and `name` (in order, not aliased) for all countries in the `continent` of `Oceania` from the `countries` table. 
```sql
-- Select code and name of countries from Oceania
SELECT code, name
FROM countries
WHERE continent = 'Oceania';
```

##### ✅ Instruction 2/2
**Task:** Now, build on your query to complete your anti join, by adding an additional filter to return every country `code` that is **not** included in the `currencies` table.
```sql
-- anti join to return every country not included in currencies table
SELECT code, name
FROM countries
WHERE continent = 'Oceania'
  AND code NOT IN
    (SELECT code
    FROM currencies);
```

