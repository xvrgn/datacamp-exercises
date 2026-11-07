## Semi Join
Let's say you are interested in identifying languages spoken in the Middle East. The `languages` table contains information about languages and countries, but it does not tell you what region the countries belong to. You can build up a semi join by filtering the `countries` table by a particular `region`, and then using this to further filter the `languages` table.

You'll build up your semi join as you did in the video exercise, block by block, starting with a selection of countries from the `countries` table, and then leveraging a `WHERE` clause to filter the `languages` table by this selection.

#### Instructions and Solutions

##### ✅ Instruction 1/3
**Task:** Select country `code` as a single field from the `countries` table, filtering for countries in the `'Middle East'` `region`.
```sql
-- Select country code for countries in the Middle East
SELECT code
FROM countries
WHERE region = 'Middle East';
```

##### ✅ Instruction 2/3
**Task 1:** Write a second query to `SELECT` the name of each unique language appearing in the `languages` table; do not use column aliases here.
```sql
-- Select unique language names
SELECT DISTINCT name
FROM languages
```

**Task 2:** Order the result set by `name` in ascending order.
```sql
-- Order by the name of the language
SELECT DISTINCT name
FROM languages
ORDER BY name;
```

##### ✅ Instruction 3/3
**Task:** Create a semi join out of the two queries you've written, which filters unique languages returned in the first query for only those languages spoken in the `'Middle East'`.
```SQL
-- Add syntax to use bracketed subquery below as a filter
SELECT DISTINCT name
FROM languages
WHERE code IN
    (SELECT code
    FROM countries
    WHERE region = 'Middle East')
ORDER BY name;
```