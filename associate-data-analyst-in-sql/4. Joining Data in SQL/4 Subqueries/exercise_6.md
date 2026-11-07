## Subquery inside FROM
Say you are interested in determining the number of languages spoken for each country. You want to present this information alongside each country's `local_name`, which is a field only present in the `countries` table and not in the `languages` table. You'll use a subquery inside `FROM` to bring information from these two tables together!

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task:** Begin with a query that groups by each country `code` from `languages`, and counts the languages spoken in each country as `lang_num`. In your `SELECT` statement, return `code` and `lang_num` (in that order).
```sql
-- Select code, and language count as lang_num
SELECT code, COUNT(name) AS lang_num
FROM languages
GROUP BY code
```

##### ✅ Instruction 1/1
**Task 1:** - Select `local_name` from `countries`, with the aliased `lang_num` from your subquery (which has been nested and aliased for you as `sub`). Use `WHERE` to match the `code` field from `countries` and `sub`.
```sql
-- Select local_name and lang_num from appropriate tables
SELECT local_name, sub.lang_num
FROM countries,
  (SELECT code, COUNT(*) AS lang_num
  FROM languages
  GROUP BY code) AS sub
-- Where codes match
WHERE countries.code = sub.code
ORDER BY lang_num DESC;
```
