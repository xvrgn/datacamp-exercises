## Subquery challenge
You're near the finish line! Test your understanding of subquerying with a challenge problem.

Suppose you're interested in analyzing inflation and unemployment rate for certain countries in 2015. You are interested in countries with `"Republic"` or `"Monarchy"` as their form of government.

You will use the field `gov_form` to filter for these two conditions, which represents a country's form of government. You can review the different entries for `gov_form` in the `countries` table.

#### Instructions and Solutions

##### ✅ Instruction 1/1
**Task 1:** - Select country `code`, `inflation_rate`, and `unemployment_rate` from `economies`.
```sql
-- Select relevant fields
SELECT code, inflation_rate, unemployment_rate
FROM economies
```

**Task 2:** Filter `code` for the set of countries which contain the words `"Republic"` or `"Monarchy"` in their `gov_form`.
```sql
-- Subquery returning country codes filtered on gov_form
  (SELECT code
  FROM countries
  WHERE gov_form LIKE '%Republic%' OR gov_form LIKE '%Monarchy%')
```

**Final Query**
```sql
-- Select relevant fields
-- Subquery returning country codes filtered on gov_form
SELECT code, inflation_rate, unemployment_rate
FROM economies
WHERE year = 2015 
  AND code IN
  (SELECT code
  FROM countries
  WHERE gov_form LIKE '%Republic%' OR gov_form LIKE '%Monarchy%')
ORDER BY inflation_rate;
```