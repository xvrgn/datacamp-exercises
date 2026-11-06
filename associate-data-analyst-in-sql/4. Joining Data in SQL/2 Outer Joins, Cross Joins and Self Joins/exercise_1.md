## This is a LEFT JOIN, right?
Nice work getting to grips with the structure of joins! In this exercise, you'll explore the differences between `INNER JOIN` and `LEFT JOIN`. This will help you decide which type of join to use.

As before, you will be using the `cities` and `countries` tables.

You'll begin with an `INNER JOIN` with the `cities` table (left) and `countries` table (right). This helps if you are interested only in records where a country is present in both tables.

You'll then change to a `LEFT JOIN`. This helps if you're interested in returning all countries in the `cities` table, whether or not they have a match in the `countries` table.

#### Instructions and Solutions

##### ✅ Instruction 1/2
**Task:** Perform an inner join with `cities AS c1` on the left and `countries as c2` on the right. Use `code` as the field to merge your tables on.
```sql
SELECT
    c1.name AS city,
    code,
    c2.name AS country,
    region,
    city_proper_pop
FROM cities AS c1
-- Perform an inner join with cities as c1 and countries as c2 on country code
INNER JOIN countries c2
ON c1.country_code = c2.code
ORDER BY code DESC;
```
##### ✅ Instruction 2/2
**Task:** Change the code to perform a `LEFT JOIN` instead of an `INNER JOIN`. After executing this query, have a look at how many records the query result contains.
```sql
SELECT 
    c1.name AS city, 
    code, 
    c2.name AS country,
    region, 
    city_proper_pop
FROM cities AS c1
-- Join right table (with alias)
LEFT JOIN countries c2
ON c1.country_code = c2.code
ORDER BY code DESC;
```