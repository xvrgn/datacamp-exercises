### Joining multiple tables
You've seen that the ability to combine multiple joins using a single query is a powerful feature of SQL.

Suppose you are interested in the relationship between fertility and unemployment rates. Your task in this exercise is to join tables to return the country name, year, fertility rate, and unemployment rate in a single result from the `countries`, `populations` and `economies` tables.

#### Instructions and Solutions

##### ✅ Instruction 1/2
**Task:** Do an inner join of `countries AS c` (left) with `populations AS p` (right), on `code`. Select `name` and `fertility_rate`.
```sql
-- Select relevant fields
SELECT name, fertility_rate
FROM countries c
-- Inner join countries and populations, aliased, on code
INNER JOIN populations p
ON c.code = p.country_code;
```

##### ✅ Instruction 2/2
**Task:** Chain an inner join with the `economies` table `AS e`, on `code`. Select `year` and `unemployment_rate` from the `economies` table.
```sql
-- Select fields
SELECT name, e.year, fertility_rate, unemployment_rate
FROM countries AS c
INNER JOIN populations AS p
ON c.code = p.country_code

-- Join to economies (as e)
INNER JOIN economies e

-- Match on country code
ON p.country_code = e.code;
```