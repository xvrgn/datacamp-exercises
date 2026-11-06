## Checking multi-table joins
Have a look at the results for Albania from the previous query below. You can see that the 2015 `fertility_rate` has been paired with 2010 `unemployment_rate`, and vice versa.

| name    | year | fertility_rate | unemployment_rate |
| ------- | ---- | -------------- | ----------------- |
| Albania | 2015 | 1.663          | 17.1              |
| Albania | 2010 | 1.663          | 14                |
| Albania | 2015 | 1.793          | 17.1              |
| Albania | 2010 | 1.793          | 14                |
Instead of four records, the query should return two: one for each year. The last join was performed on `c.code = e.code`, without also joining on `year`. Your task in this exercise is to fix your query by explicitly stating that _both_ the country `code` _and_ `year` should match!
#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task:** Modify your query so that you are joining to `economies` on `year` as well as `code`.
```sql
SELECT name, e.year, fertility_rate, unemployment_rate
FROM countries AS c
INNER JOIN populations AS p
ON c.code = p.country_code
INNER JOIN economies AS e
ON c.code = e.code
-- Add an additional joining condition such that you are also joining on year
    AND p.year = e.year;
```