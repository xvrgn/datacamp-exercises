### Joining with aliased tables
Table aliases are helpful in allowing you to reference them in other parts of your query, like the `SELECT` statement.

When you `SELECT` fields, a field can be ambiguous. For example, imagine two tables, `apples` and `oranges`, both containing a column called `color`. You need to use the syntax `apples.color` or `oranges.color` in your `SELECT` statement to point SQL to the correct table. Without this, you would get the following error:

```
  column reference "color" is ambiguous
```

You'll practice joining with aliased tables using data from both the `countries` and `economies` tables to examine the inflation rate in 2010 and 2015.

When writing joins, many SQL users prefer to write the `SELECT` statement _after_ writing the join code, in case the `SELECT` statement requires using table aliases.

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task 1:** Start with your inner join in line 5; join the tables `countries AS c` (left) with `economies` (right), aliasing `economies AS e`.
```sql
-- Join to economies (alias e)
FROM countries AS c
INNER JOIN economies e
```


**Task 2:** Next, use `code` as your joining field in line 7; do **not** use the `USING` command here.
```sql
-- Match on code field using table aliases
ON c.code = e.code
```

**Task 3:** Lastly, select the following columns **in order** in line 2: `code` from the `countries` table (aliased as `country_code`), `name`, `year`, and `inflation_rate`.
```sql
-- Select fields with aliases
SELECT c.code AS country_code, name, year, inflation_rate
```

**Final query**
```sql
SELECT c.code AS country_code, name, year, inflation_rate
FROM countries AS c
INNER JOIN economies e
ON c.code = e.code;
```