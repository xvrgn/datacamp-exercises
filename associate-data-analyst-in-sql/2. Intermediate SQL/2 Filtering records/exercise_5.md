### Using BETWEEN
Let's use `BETWEEN` with `AND` on the films database to get the `title` and `release_year` of all Spanish-language films released between 1990 and 2000 (inclusive) with budgets over $100 million.

We have broken the problem into smaller steps so that you can build the query as you go along!

#### Instructions and Solutions
##### ✅ Instruction 1/4
**Task:** Select the `title` and `release_year` of all films released between 1990 and 2000 (inclusive) using `BETWEEN`.
```SQL
-- Select the title and release_year for films released between 1990 and 2000
SELECT title, release_year
FROM films
WHERE release_year BETWEEN 1990 AND 2000
```
##### ✅ Instruction 2/4
**Task:** Build on your previous query to select only films with a `budget` over $100 million.
```SQL
-- Narrow down your query to films with budgets > $100 million
SELECT title, release_year
FROM films
WHERE release_year BETWEEN 1990 AND 2000
	AND (budget > 100000000)
```
##### ✅ Instruction 3/4
**Task:** Now, restrict the query to only return Spanish-language films.
```sql
-- Restrict the query to only Spanish-language films
SELECT title, release_year
FROM films
WHERE release_year BETWEEN 1990 AND 2000
    AND budget > 100000000
    AND language = 'Spanish';
```
##### ✅ Instruction 4/4
**Task:** Finally, amend the query to include all Spanish-language _or_ French-language films with the same criteria.
```sql
-- Amend the query to include Spanish or French-language films
SELECT title, release_year
FROM films
WHERE release_year BETWEEN 1990 AND 2000
    AND budget > 100000000
    AND (language = 'Spanish' OR language = 'French');
```

